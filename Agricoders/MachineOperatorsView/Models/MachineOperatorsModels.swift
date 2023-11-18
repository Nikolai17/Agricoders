//
//  Models.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 17.11.2023.
//

import Foundation

struct MachineOperatorsModels {
    let fio: (String, WorkStatus)
    let field: (String, String)
    let machine: Machine
    let instr: Insrument
    let scopeWork: String
}

let objects2: [MachineOperatorsModels] = [
    .init(fio: ("Иванов А.В", .enable), field: ("Поле 1", "100 га"), machine: .combine_harvester, instr: .cultivator, scopeWork: "10 га"),
    .init(fio: ("Петров А.В", .disable), field: ("Поле 1", "100 га"), machine: .combine_harvester, instr: .cultivator, scopeWork: "10 га"),
    .init(fio: ("Сидоров А.В", .enable), field: ("Поле 1", "100 га"), machine: .tractor, instr: .cultivator, scopeWork: "10 га"),
    .init(fio: ("Перепечко А.В", .disable), field: ("Поле 1", "100 га"), machine: .combine_harvester, instr: .cultivator, scopeWork: "10 га"),
    .init(fio: ("Тестов А.В", .enable), field: ("Поле 1", "100 га"), machine: .tractor, instr: .cultivator, scopeWork: "10 га"),
    .init(fio: ("Иванов А.В", .disable), field: ("Поле 1", "100 га"), machine: .combine_harvester, instr: .cultivator, scopeWork: "10 га"),
    .init(fio: ("Иванов А.В", .enable), field: ("Поле 1", "100 га"), machine: .combine_harvester, instr: .cultivator, scopeWork: "10 га"),
    .init(fio: ("Иванов А.В", .disable), field: ("Поле 1", "100 га"), machine: .combine_harvester, instr: .cultivator, scopeWork: "10 га")
]
