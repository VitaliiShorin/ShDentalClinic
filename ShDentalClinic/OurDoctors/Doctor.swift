//
//  Doctor.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 09.05.2025.
//

import Foundation


struct Doctor {
    let fullName: String
    let speciality: String
    let imageName: String
    let screen1: Screen
    let action2: Screen
    let action3: Screen
}

let doctors: [Doctor] = [
    Doctor(
        fullName: "Морозов\nАнатолий\nВладимирович",
        speciality: "Главный врач\nХирург\nОртодонт",
        imageName: "Анатолий",
        screen1: .test1,
        action2: .test2,
        action3: .test3
    ),
    Doctor(
        fullName: "Аксенова\nВиктория\nВячеславовна",
        speciality: "Детский стоматолог\nТерапевт",
        imageName: "Виктория",
        screen1: .test1,
        action2: .test2,
        action3: .test3
    ),
    Doctor(
        fullName: "Дмитриева\nАнна\nСергеевна",
        speciality: "Имплантолог\nПародонтолог\nТерапевт",
        imageName: "Анна",
        screen1: .test1,
        action2: .test2,
        action3: .test3
    ),
    Doctor(
        fullName: "Дементьев\nВячеслав\nВладимирович",
        speciality: "Челюстно-лицевой хирург\nВедущий специалист клиники",
        imageName: "Вячеслав",
        screen1: .test1,
        action2: .test2,
        action3: .test3
    ),
    Doctor(
        fullName: "Одинцов\nДмитрий\nОлегович",
        speciality: "Детский стоматолог\nОртодонт",
        imageName: "Дмитрий",
        screen1: .test1,
        action2: .test2,
        action3: .test3
    ),
    Doctor(
        fullName: "Филлатова\nМария\nСергеевна",
        speciality: "Cтоматолог\nТерапевт",
        imageName: "Мария",
        screen1: .test1,
        action2: .test2,
        action3: .test3
    ),
    Doctor(
        fullName: "Анисимова\nНадежда\nВладимировна",
        speciality: "Cтоматолог\nТерапевт\nОртодонт",
        imageName: "Надежда",
        screen1: .test1,
        action2: .test2,
        action3: .test3
    ),
    Doctor(
        fullName: "Вишнякова\nНина\nНиколаевна",
        speciality: "Детский стоматолог\nПародонтолог\nТерапевт",
        imageName: "Нина",
        screen1: .test1,
        action2: .test2,
        action3: .test3
    )
]
