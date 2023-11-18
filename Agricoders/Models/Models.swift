//
//  Models.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 17.11.2023.
//

import Foundation

struct AgroObject {
    let field: (String, String)
    let workers: [Workers]
}

struct Workers {
    let fio: (String, WorkStatus)
    let machine: Machine
    let instr: Insrument
    let scopeWork: String
}

enum WorkStatus: String {
    case enable = "В работе"
    case disable = "В простое"
}

enum Insrument: String {
    case plow = "Плуг"
    case cultivator = "Культиватор"
}

enum Machine: String {
    case combine_harvester = "Комбайн"
    case tractor = "Трактор"
}

let objects: [AgroObject] = [
    .init(
        field: ("Поле 1", "100 га"),
        workers: [
            .init(fio: ("Петров Н.В.", .enable), machine: .combine_harvester, instr: .cultivator, scopeWork: "40 га"),
            .init(fio: ("Иванов Н.В.", .enable), machine: .tractor, instr: .cultivator, scopeWork: "40 га")
        ]
    ),
    .init(
        field: ("Поле 2", "100 га"),
        workers: [
            .init(fio: ("Сидоров Н.В.", .disable), machine: .combine_harvester, instr: .cultivator, scopeWork: "40 га")
        ]
    ),
    .init(
        field: ("Поле 3", "100 га"),
        workers: [
            .init(fio: ("Конашенков Н.В.", .enable), machine: .combine_harvester, instr: .cultivator, scopeWork: "40 га")
        ]
    ),
    .init(
        field: ("Поле 4", "100 га"),
        workers: [
            .init(fio: ("Тестов Н.В.", .enable), machine: .combine_harvester, instr: .cultivator, scopeWork: "40 га")
        ]
    ),
    .init(
        field: ("Поле 5", "100 га"),
        workers: [
            .init(fio: ("Петров Н.В.", .enable), machine: .combine_harvester, instr: .cultivator, scopeWork: "40 га")
        ]
    ),
    .init(
        field: ("Поле 6", "100 га"),
        workers: [
            .init(fio: ("Петров Н.В.", .enable), machine: .combine_harvester, instr: .cultivator, scopeWork: "40 га"),
            .init(fio: ("Иванов Н.В.", .enable), machine: .tractor, instr: .cultivator, scopeWork: "40 га")
        ]
    ),
    .init(
        field: ("Поле 7", "100 га"),
        workers: [
            .init(fio: ("Петров Н.В.", .enable), machine: .combine_harvester, instr: .cultivator, scopeWork: "40 га"),
            .init(fio: ("Иванов Н.В.", .enable), machine: .tractor, instr: .cultivator, scopeWork: "40 га")
        ]
    ),
]


