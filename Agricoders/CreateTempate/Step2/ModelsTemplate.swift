//
//  ModelsTemplate.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import Foundation

var templateStep2Object: [Step2CellModel] = [
    .init(isChecked: false, fieldName: "А-121-АБ", scopeText: "100 га"),
    .init(isChecked: false, fieldName: "А-122-АБ", scopeText: "100 га"),
    .init(isChecked: false, fieldName: "А-123-АБ", scopeText: "100 га"),
    .init(isChecked: false, fieldName: "А-124-АБ", scopeText: "100 га"),
    .init(isChecked: false, fieldName: "А-125-АБ", scopeText: "100 га"),
    .init(isChecked: false, fieldName: "А-126-АБ", scopeText: "100 га"),
    .init(isChecked: false, fieldName: "А-127-АБ", scopeText: "100 га"),
    .init(isChecked: false, fieldName: "А-128-АБ", scopeText: "100 га"),
    .init(isChecked: false, fieldName: "А-129-АБ", scopeText: "100 га"),
    .init(isChecked: false, fieldName: "А-130-АБ", scopeText: "100 га"),
    .init(isChecked: false, fieldName: "А-131-АБ", scopeText: "100 га"),
    .init(isChecked: false, fieldName: "А-132-АБ", scopeText: "100 га")
]

let templateStep3Object: [Step3CellModel] = [
    .init(isChecked: false, fieldName: "Обработка культиватором-плоскорезом"),
    .init(isChecked: false, fieldName: "Предпосевная обработка почвы"),
    .init(isChecked: false, fieldName: "Посев яровой пшеницы "),
    .init(isChecked: false, fieldName: "Уборка урожая"),
    .init(isChecked: false, fieldName: "Обработка почвы")
]

let templateStep4Object: [Step4CellModel] = [
    .init(isChecked: false, fieldName: "КПШ-9", status: .disable),
    .init(isChecked: false, fieldName: "Amazone DMC 9000", status: .enable),
    .init(isChecked: false, fieldName: "Bourgault 3275", status: .disable),
    .init(isChecked: false, fieldName: "Bourgault 5810", status: .enable)
]

let templateStep5Object: [Step4CellModel] = [
    .init(isChecked: false, fieldName: "RSM 3535", status: .disable),
    .init(isChecked: false, fieldName: "RSM 3575", status: .enable),
    .init(isChecked: false, fieldName: "RSM 2375", status: .disable),
    .init(isChecked: false, fieldName: "K-742", status: .enable),
    .init(isChecked: false, fieldName: "Не требуется", status: nil)
]

let templateStep6Object: [Step6CellModel] = [
    .init(titleLabel: "Механизатор", descriptionLabel: "Григорьев С.А."),
    .init(titleLabel: "Поле", descriptionLabel: "А-121-Ав"),
    .init(titleLabel: "Операция", descriptionLabel: "Обработка культиватором-плоскорезом"),
    .init(titleLabel: "Агрегат", descriptionLabel: "КПШ-9"),
    .init(titleLabel: "Техника", descriptionLabel: "RSM 3535")
]

let readyTemplateStep1Object: [ReadyTemplateStep1Model] = [
    .init(
        titleLabel: "Посев яровой пшеницы",
        titleSizeLabel: "40 га",
        descriptionLabel: "Сеялка рядовая",
        descriptionSizeLabel: "3 см"
    ),
    .init(
        titleLabel: "Обработка культиватором",
        titleSizeLabel: "30 га",
        descriptionLabel: "КПШ-9",
        descriptionSizeLabel: "10–12см"
    ),
    .init(
        titleLabel: "Посев чечевицы",
        titleSizeLabel: "50 га",
        descriptionLabel: "Сеялка рядовая № 2",
        descriptionSizeLabel: "3см"
    ),
    .init(
        titleLabel: "Посев чечевицы",
        titleSizeLabel: "50 га",
        descriptionLabel: "Сеялка рядовая № 2",
        descriptionSizeLabel: "3см"
    ),
    .init(
        titleLabel: "Обработка культиватором",
        titleSizeLabel: "30 га",
        descriptionLabel: "КПШ-9",
        descriptionSizeLabel: "10–12см"
    ),
    .init(
        titleLabel: "Предпосевная обработка почвы",
        titleSizeLabel: "45 га",
        descriptionLabel: "ПШП-8",
        descriptionSizeLabel: "25см"
    )
]
