//
//  NFCUtility.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 17.11.2023.
//

import Foundation
import CoreNFC

enum NFCError: LocalizedError {
    case unavailable
    case invalidated(message: String)
    case invalidPayloadSize

    var errorDescription: String? {
        switch self {
        case .unavailable:
            return "NFC Reader Not Available"
        case let .invalidated(message):
            return message
        case .invalidPayloadSize:
            return "NDEF payload size exceeds the tag limit"
        }
    }
}

class NFCUtility: NSObject {

    static let shared = NFCUtility()

    private var session: NFCNDEFReaderSession?
    private var completion: ((Result<Void, NFCError>) -> Void)?
    private var url: URL?

    func start(completion: @escaping (Result<Void, NFCError>) -> Void) {
        guard NFCNDEFReaderSession.readingAvailable else {
            completion(.failure(.unavailable))
            print("NFC is not available on this device")
            return
        }
        self.completion = completion
        session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        session?.alertMessage = "Place tag near iPhone to pass the data"
        session?.begin()
    }
}

// MARK: - NFC NDEF Reader Session Delegate
extension NFCUtility: NFCNDEFReaderSessionDelegate {

    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        print(#function)
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print(messages)
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        guard let tag = tags.first, tags.count == 1 else {
            session.alertMessage = "There are too many tags present. Remove all and then try again."
            DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(500)) {
                session.restartPolling()
            }
            return
        }
        session.connect(to: tag) { error in
            if let error = error {
                self.handleError(error)
                return
            }
            tag.queryNDEFStatus { status, _, error in
                if let error = error {
                    self.handleError(error)
                    return
                }
                switch status {
                case .notSupported:
                    session.alertMessage = "Unsupported tag."
                    session.invalidate()
                    
                @unknown default:
                    fatalError()
                }
            }
        }
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        if let error = error as? NFCReaderError, ![.readerSessionInvalidationErrorFirstNDEFTagRead, .readerSessionInvalidationErrorUserCanceled].contains(error.code) {
            completion?(.failure(NFCError.invalidated(message: error.localizedDescription)))
        }
        self.session = nil
        completion = nil
    }

    private func handleError(_ error: Error) {
        session?.alertMessage = error.localizedDescription
        session?.invalidate()
    }
}
