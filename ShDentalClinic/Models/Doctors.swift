//
//  Doctors.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 11.05.2025.
//

import Foundation

struct Doctor: Identifiable {
    let id: UUID
    let name: String
    let surname: String
    let patronymic: String
    let fullName: String
    let speciality: String
    let imageName: String
    let education: String
    let certificate: String
    let continuingEducation: String
    let professionalSkills: String
    let availableHours: [String]
    let relatedSpecialties: [String]
    let workingDays: [Int]
}

let doctors: [Doctor] = [
    Doctor(
        id: UUID(),
        name: "Виктория",
        surname: "Аксенова",
        patronymic: "Вячеславовна",
        fullName: "Аксенова\nВиктория\nВячеславовна",
        speciality: "Детский стоматолог\nТерапевт",
        imageName: "Виктория",
        education: """
            2023 г. - Санкт-Петербургский Государственный Медицинский Университет им. акад. И.П. Павлова, специальность "Стоматология"
            \n2025 г. - Ординатура при Детском Городском Клиническом Госпитале Санкт-Петербурга, специальность "Стоматология детская"
            """,
        certificate: """
            № 0071200049329 "Стоматология детская" до 19.06.2030 г.
            """,
        continuingEducation: """
            • Лечение стоматологических заболеваний у детей.
            \n•  Профилактика и лечение кариеса у детей.
            \n• Ортодонтические проблемы в детской стоматологии.
            """,
        professionalSkills: """
            • Профилактическое лечение. 
            \n• Оценка состояния зубочелюстной системы детей. 
            \n• Проведение лечения кариеса у детей. 
            \n• Установка временных и постоянных пломб. 
            \n• Ортодонтическое лечение и коррекция прикуса у детей. 
            \n• Консультирование родителей по вопросам гигиены полости рта и профилактики зубных заболеваний. 
            """,
        availableHours: ["11:00", "12:00", "13:00", "14:00", "16:00", "17:00", "18:00", "19:00", "20:00"],
        relatedSpecialties: ["Терапия", "Ортопедия", "Ортодонтия", "Детская стоматология", "Гигиена полости рта", "Консультации", "Отбеливание и эстетика"],
        workingDays: [2, 3, 4, 5, 6] // Пн, Вт, Ср, Чт, Пт
    ),
    Doctor(
        id: UUID(),
        name: "Анна",
        surname: "Дмитриева",
        patronymic: "Сергеевна",
        fullName: "Дмитриева\nАнна\nСергеевна",
        speciality: "Имплантолог\nПародонтолог\nТерапевт",
        imageName: "Анна",
        education: """
            2015 г. - Казанский Государственный Медицинский Университет, специальность "Стоматология"
            \n2017 г. - Ординатура по ортодонтии при НИИ стоматологии и челюстно-лицевой хирургии, Москва
            """,
        certificate: """
            № 0071200049330 "Ортодонтия" до 19.06.2027 г.
            """,
        continuingEducation: """
            • Ортодонтия: современные методы диагностики.
            \n• Исправление аномалий прикуса.
            \n• Эстетические брекет-системы: применение и технологии.
            \n• Лечение заболеваний десен в ортодонтии.
            \n• Применение 3D-технологий в ортодонтии.
            """,
        professionalSkills: """
            • Диагностика аномалий прикуса. 
            \n• Создание и использование индивидуальных лечебных планов. 
            \n• Установка и коррекция брекет-систем. 
            \n• Анализ рентгенологических снимков. 
            \n• Работа с анестезией и осложнениями при ортодонтическом лечении. 
            \n• Консультирование пациентов по уходу за ортодонтическими конструкциями.
            """,
        availableHours: ["09:00", "10:00", "11:00", "12:00", "13:00"],
        relatedSpecialties: ["Ортодонтия", "Пародонтология", "Гигиена полости рта", "Имплантология", "Консультации", "Отбеливание и эстетика"],
        workingDays: [1, 2, 4, 5, 7] // Вс, Пн, Ср, Чт, Сб
    ),
    Doctor(
        id: UUID(),
        name: "Вячеслав",
        surname: "Дементьев",
        patronymic: "Владимирович",
        fullName: "Дементьев\nВячеслав\nВладимирович",
        speciality: "Челюстно-лицевой хирург\nВедущий специалист клиники",
        imageName: "Вячеслав",
        education: """
            2014 г. - Российский Университет Дружбы Народов, специальность "Стоматология"
            \n2016 г. - Ординатура по челюстно-лицевой хирургии при Центральном НИИ стоматологии и челюстно-лицевой хирургии, Москва
            """,
        certificate: """
            № 0071200049331 "Челюстно-лицевая хирургия" до 18.06.2026 г.
            """,
        continuingEducation: """
            • Хирургические методы лечения челюстно-лицевых аномалий.
            \n• Устранение дефектов челюстно-лицевой области.
            \n• Реконструктивная хирургия.
            \n• Профилактика и лечение воспалительных заболеваний.
            \n• Современные методы анестезии в челюстно-лицевой хирургии.
            """,
        professionalSkills: """
            • Хирургическая коррекция аномалий челюстно-лицевой области. 
            \n• Проведение сложных оперативных вмешательств. 
            \n• Использование минимально инвазивных хирургических техник. 
            \n• Диагностика и лечение заболеваний челюстно-лицевой области. 
            \n• Консультирование по вопросам реабилитации после операций. 
            \n• Оценка и снижение рисков при хирургических вмешательствах.
            """,
        availableHours: ["12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00"],
        relatedSpecialties: ["Терапия", "Хирургия", "Пародонтология", "Имплантология", "Консультации"],
        workingDays: [1, 2, 3, 4] // Вс, Пн, Вт, Ср
    ),
    Doctor(
        id: UUID(),
        name: "Мария",
        surname: "Филлатова",
        patronymic: "Сергеевна",
        fullName: "Филлатова\nМария\nСергеевна",
        speciality: "Cтоматолог\nТерапевт",
        imageName: "Мария",
        education: """
            2020 г. - Московский Государственный Медицинский Университет им. И.М. Сеченова, специальность "Стоматология"
            \n2022 г. - Ординатура по стоматологии общей практики, Московская Медицинская Академия им. И.М. Сеченова
            """,
        certificate: """
            № 0071200049333 "Стоматология общей практики" до 18.06.2027 г.
            """,
        continuingEducation: """
            • Лечение кариеса и его осложнений.
            \n• Современные методы реставрации зубов.
            \n• Методология стоматологического осмотра и диагностики.
            """,
        professionalSkills: """
            • Проведение стоматологических осмотров и диагностики. 
            \n• Лечение кариеса, пульпита и других стоматологических заболеваний. 
            \n• Изготовление художественных реставраций и пломб. 
            \n• Использование современных методик анестезии. 
            \n• Консультирование пациентов по вопросам ухода за полостью рта. 
            \n• Подбор индивидуальных гигиенических средств.
            """,
        availableHours: ["15:00", "16:00", "17:00", "18:00", "19:00", "20:00"],
        relatedSpecialties: ["Терапия", "Гигиена полости рта", "Консультации", "Отбеливание и эстетика"],
        workingDays: [1, 2, 6, 7] // Вс, Пн, Пт, Сб
    ),
    Doctor(
        id: UUID(),
        name: "Надежда",
        surname: "Анисимова",
        patronymic: "Владимировна",
        fullName: "Анисимова\nНадежда\nВладимировна",
        speciality: "Cтоматолог\nТерапевт\nОртодонт",
        imageName: "Надежда",
        education: """
            1999 г. - Московская медицинская академия им. И.М. Сеченова, специальность "Стоматология"
            \n2001 г. - Ординатура по ортодонтии, Московский Областной НИИ стоматологии, Москва
            """,
        certificate: """
            № 0071200049334 "Ортодонтия" до 19.06.2026 г.
            """,
        continuingEducation: """
            • Современные подходы к диагностике и лечению аномалий прикуса.
            \n• Постоянные и съемные ортодонтические конструкции.
            \n• Эстетическая стоматология: новые тенденции.
            \n• Комплексное лечение заболеваний десен.
            \n• Ортодонтические методы лечения у взрослых.
            \n• Инновационные методы в восстановительной стоматологии.
            \n• Ортопедическая реабилитация с использованием имплантатов.
            \n• Эстетическое ортопедическое лечение.
            \n• Современные подходы к диагностике и лечению заболеваний челюстно-лицевой области.
            \n• Методики минимально инвазивной хирургии в стоматологии.
            """,
        professionalSkills: """
            • Составление программ лечения пациентов с аномалиями прикуса. 
            \n• Использование различных типов брекет-систем. 
            \n• Проведение профессиональной гигиенической чистки. 
            \n• Консультирование пациентов по вопросам ухода за брекетами. 
            \n• Реабилитация после ортодонтических вмешательств. 
            \n• Выполнение эстетических реставраций.
            """,
        availableHours: ["09:00", "10:00", "11:00", "16:00", "17:00", "18:00", "19:00", "20:00"],
        relatedSpecialties: ["Терапия", "Ортодонтия", "Гигиена полости рта", "Консультации", "Отбеливание и эстетика"],
        workingDays: [3, 4, 5, 6] // Вт, Ср, Чт, Пт
    ),
    Doctor(
        id: UUID(),
        name: "Нина",
        surname: "Вишнякова",
        patronymic: "Николаевна",
        fullName: "Вишнякова\nНина\nНиколаевна",
        speciality: "Детский стоматолог\nПародонтолог\nТерапевт",
        imageName: "Нина",
        education: """
            2013 г. - Дальневосточный Государственный Медицинский Университет, специальность "Стоматология"
            \n2015 г. - Ординатура по детской стоматологии при НИИ стоматологии, Владивосток
            """,
        certificate: """
            № 0071200049335 "Пародонтология" до 19.06.2028 г.
            """,
        continuingEducation: """
            • Лечение заболеваний пародонта у детей.
            \n• Профилактика заболеваний десен.
            """,
        professionalSkills: """
            • Профилактика и лечение заболеваний десен у детей. 
            \n• Команда по стоматологии для детей с особыми потребностями. 
            \n• Проведение детских стоматологических осмотров. 
            """,
        availableHours: ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00"],
        relatedSpecialties: ["Терапия", "Детская стоматология", "Пародонтология", "Гигиена полости рта", "Консультации"],
        workingDays: [5, 6, 7] // Чт, Пт, Сб
    )
]
