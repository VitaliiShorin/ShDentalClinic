//
//  Procedures.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 18.05.2025.
//

import Foundation
// Основные направления
struct MainAreas: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let allProceduresOfTheSpecialty: [ProcedureName]
}

// Название процедуры
struct ProcedureName: Identifiable {
    let id = UUID()
    let name: String
    let price: String
}

let serviceCategories: [MainAreas] = [
    MainAreas(
        name: "Терапия",
        image: "Терапия",
        allProceduresOfTheSpecialty: [
            ProcedureName(name: "Пломбировка одноканального зуба", price: "2 500 ₽"),
            ProcedureName(name: "Пломбировка многоканального зуба", price: "3 500 ₽"),
            ProcedureName(name: "Эстетическое восстановление зуба", price: "4 000 ₽"),
            ProcedureName(name: "Лечение глубокого кариеса", price: "3 000 ₽"),
            ProcedureName(name: "Восстановление переднего зуба", price: "5 000 ₽"),
            ProcedureName(name: "Лечение осложнённого кариеса", price: "3 500 ₽"),
            ProcedureName(name: "Пломбирование временных зубов", price: "2 000 ₽"),
            ProcedureName(name: "Реминерализация эмали", price: "1 500 ₽"),
            ProcedureName(name: "Герметизация фиссур", price: "1 800 ₽"),
            ProcedureName(name: "Эндодонтическое лечение", price: "7 000 ₽"),
            ProcedureName(name: "Восстановление культей зуба штифтом", price: "2 800 ₽"),
            ProcedureName(name: "Медикаментозная обработка каналов", price: "1 100 ₽"),
            ProcedureName(name: "Раскрытие полости зуба", price: "1 400 ₽"),
            ProcedureName(name: "Временная пломба", price: "700 ₽"),
            ProcedureName(name: "Механическая обработка каналов", price: "2 000 ₽"),
            ProcedureName(name: "Закрытие перфорации", price: "2 500 ₽"),
            ProcedureName(name: "Лечение периодонтита", price: "4 000 ₽"),
            ProcedureName(name: "Распломбировка канала", price: "1 900 ₽"),
            ProcedureName(name: "Лечение пульпита", price: "3 200 ₽"),
            ProcedureName(name: "Извлечение инородного тела из канала", price: "1 600 ₽")
        ]
    ),
    MainAreas(
        name: "Ортопедия",
        image: "Ортопедия",
        allProceduresOfTheSpecialty: [
            ProcedureName(name: "Металлокерамическая коронка", price: "12 000 ₽"),
            ProcedureName(name: "Безметалловая коронка", price: "21 000 ₽"),
            ProcedureName(name: "Винир керамический", price: "23 000 ₽"),
            ProcedureName(name: "Винир композитный", price: "14 000 ₽"),
            ProcedureName(name: "Бюгельный протез", price: "25 000 ₽"),
            ProcedureName(name: "Акриловый протез", price: "17 000 ₽"),
            ProcedureName(name: "Культявая вкладка", price: "5 500 ₽"),
            ProcedureName(name: "Временная коронка", price: "2 000 ₽"),
            ProcedureName(name: "Съёмный пластиночный протез", price: "15 000 ₽"),
            ProcedureName(name: "Цельнолитая коронка", price: "9 500 ₽"),
            ProcedureName(name: "Адгезивный мостовидный протез", price: "14 000 ₽"),
            ProcedureName(name: "Сендвич-протез", price: "18 000 ₽"),
            ProcedureName(name: "Микропротез инлей", price: "12 000 ₽"),
            ProcedureName(name: "Штифтовая фиксация коронки", price: "2 700 ₽"),
            ProcedureName(name: "Цементировка коронки", price: "1 200 ₽"),
            ProcedureName(name: "Перебазировка съемного протеза", price: "3 800 ₽"),
            ProcedureName(name: "Ремонт съемного протеза", price: "2 500 ₽"),
            ProcedureName(name: "Снятие старой коронки", price: "1 500 ₽"),
            ProcedureName(name: "Установка замковых креплений", price: "7 500 ₽")
        ]
    ),
    MainAreas(
        name: "Хирургия",
        image: "Хирургия",
        allProceduresOfTheSpecialty: [
            ProcedureName(name: "Удаление однокорневого зуба", price: "2 800 ₽"),
            ProcedureName(name: "Удаление многокорневого зуба", price: "3 900 ₽"),
            ProcedureName(name: "Сложное удаление зуба мудрости", price: "6 000 ₽"),
            ProcedureName(name: "Резекция верхушки корня", price: "7 500 ₽"),
            ProcedureName(name: "Имплантация зуба", price: "21 000 ₽"),
            ProcedureName(name: "Синус-лифтинг", price: "14 000 ₽"),
            ProcedureName(name: "Пластика уздечки губы", price: "2 500 ₽"),
            ProcedureName(name: "Кюретаж лунки", price: "1 300 ₽"),
            ProcedureName(name: "Удаление кисты", price: "6 500 ₽"),
            ProcedureName(name: "Атипичное удаление зуба", price: "4 800 ₽"),
            ProcedureName(name: "Гемисекция", price: "5 300 ₽"),
            ProcedureName(name: "Пластика костной ткани", price: "15 000 ₽"),
            ProcedureName(name: "Закрытие соустья", price: "2 100 ₽"),
            ProcedureName(name: "Операция удаления импланта", price: "10 000 ₽"),
            ProcedureName(name: "Коррекция десны", price: "3 500 ₽"),
            ProcedureName(name: "Диссекция капюшона", price: "1 500 ₽"),
            ProcedureName(name: "Вестибулопластика", price: "8 500 ₽"),
            ProcedureName(name: "Операция Гингивэктомия", price: "4 000 ₽"),
            ProcedureName(name: "Удаление капюшона над зубом мудрости", price: "1 600 ₽"),
            ProcedureName(name: "Пересадка соединительнотканного лоскута", price: "13 000 ₽")
        ]
    ),
    MainAreas(
        name: "Ортодонтия",
        image: "Ортодонтия",
        allProceduresOfTheSpecialty: [
            ProcedureName(name: "Металлические брекеты", price: "45 000 ₽"),
            ProcedureName(name: "Керамические брекеты", price: "55 000 ₽"),
            ProcedureName(name: "Сапфировые брекеты", price: "65 000 ₽"),
            ProcedureName(name: "Лингвальные брекеты", price: "105 000 ₽"),
            ProcedureName(name: "Элайнеры (1 челюсть)", price: "40 000 ₽"),
            ProcedureName(name: "Ретейнер несъемный", price: "6 000 ₽"),
            ProcedureName(name: "Ретейнер съемный", price: "4 500 ₽"),
            ProcedureName(name: "Лечение на пластинках", price: "20 000 ₽"),
            ProcedureName(name: "Ортодонтическая консультация", price: "800 ₽"),
            ProcedureName(name: "Активатор", price: "8 000 ₽"),
            ProcedureName(name: "Установка лигатуры", price: "2 500 ₽"),
            ProcedureName(name: "Снятие брекет-системы (1 чел.)", price: "5 000 ₽"),
            ProcedureName(name: "Дуга – замена/установка", price: "2 100 ₽"),
            ProcedureName(name: "Поклейка брекета", price: "700 ₽"),
            ProcedureName(name: "Мини-имплант ортодонтический", price: "7 500 ₽"),
            ProcedureName(name: "Межчелюстная тяга (монтаж)", price: "1 400 ₽"),
            ProcedureName(name: "Исправление скученности зубов", price: "от 40 000 ₽"),
            ProcedureName(name: "Миопротектор", price: "7 200 ₽"),
            ProcedureName(name: "Контрольная консультация ортодонта", price: "500 ₽")
        ]
    ),
    MainAreas(
        name: "Детская стоматология",
        image: "ДетскаяСтоматология",
        allProceduresOfTheSpecialty: [
            ProcedureName(name: "Пломбирование молочного зуба", price: "1 800 ₽"),
            ProcedureName(name: "Лечение пульпита молочного зуба", price: "3 700 ₽"),
            ProcedureName(name: "Лечение кариеса молочного зуба", price: "2 200 ₽"),
            ProcedureName(name: "Герметизация фиссур молочных зубов", price: "1 500 ₽"),
            ProcedureName(name: "Профессиональная чистка молочных зубов", price: "1 300 ₽"),
            ProcedureName(name: "Удаление молочного зуба", price: "2 000 ₽"),
            ProcedureName(name: "Фторирование зубов", price: "1 400 ₽"),
            ProcedureName(name: "Профилактический осмотр", price: "900 ₽"),
            ProcedureName(name: "Пломбирование постоянного незрелого зуба", price: "2 300 ₽"),
            ProcedureName(name: "Серебрение зубов", price: "1 200 ₽"),
            ProcedureName(name: "Шлифовка молочного зуба", price: "1 000 ₽"),
            ProcedureName(name: "Восстановление скола молочного зуба", price: "1 700 ₽"),
            ProcedureName(name: "Удаление сверхкомплектных зубов", price: "3 900 ₽"),
            ProcedureName(name: "Аппликация антисептика", price: "600 ₽"),
            ProcedureName(name: "Премьерная реставрация", price: "2 000 ₽"),
            ProcedureName(name: "Специализированная чистка во сне", price: "от 5 500 ₽"),
            ProcedureName(name: "Оценка формирующегося прикуса", price: "1 100 ₽"),
            ProcedureName(name: "Лечение гипоплазии эмали", price: "2 100 ₽"),
            ProcedureName(name: "Лечение травмы зуба", price: "2 700 ₽")
        ]
    ),
    MainAreas(
        name: "Пародонтология",
        image: "Пародонтология",
        allProceduresOfTheSpecialty: [
            ProcedureName(name: "Лечение гингивита", price: "3 000 ₽"),
            ProcedureName(name: "Лечение пародонтита", price: "4 500 ₽"),
            ProcedureName(name: "Профессиональная гигиена зубов (ультразвук)", price: "4 000 ₽"),
            ProcedureName(name: "Удаление зубного камня", price: "2 500 ₽"),
            ProcedureName(name: "Чистка Air Flow", price: "2 800 ₽"),
            ProcedureName(name: "Шинирование зубов", price: "8 500 ₽"),
            ProcedureName(name: "Закладка лекарств в десну", price: "1 000 ₽"),
            ProcedureName(name: "Кюретаж пародонтального кармана", price: "2 000 ₽"),
            ProcedureName(name: "Полировка зубов", price: "1 200 ₽"),
            ProcedureName(name: "Лоскутная операция", price: "10 000 ₽"),
            ProcedureName(name: "Плазмотерапия для десен", price: "3 500 ₽"),
            ProcedureName(name: "Аппликации с антисептиками", price: "600 ₽"),
            ProcedureName(name: "Пародонтологический массаж", price: "1 200 ₽"),
            ProcedureName(name: "Промывание пародонтальных карманов", price: "900 ₽"),
            ProcedureName(name: "Забор биоматериала с десны", price: "2 000 ₽"),
            ProcedureName(name: "Лечение десневой улыбки", price: "от 5 000 ₽")
        ]
    ),
    MainAreas(
        name: "Гигиена полости рта",
        image: "ГигиенаПолостиРта",
        allProceduresOfTheSpecialty: [
            ProcedureName(name: "Профессиональная гигиена полости рта", price: "4 500 ₽"),
            ProcedureName(name: "Снятие зубного камня ультразвуком", price: "2 200 ₽"),
            ProcedureName(name: "Чистка Air Flow", price: "2 500 ₽"),
            ProcedureName(name: "Полировка зубов", price: "1 300 ₽"),
            ProcedureName(name: "Фторирование зубов", price: "1 200 ₽"),
            ProcedureName(name: "Покрытие зубов лаком", price: "1 000 ₽"),
            ProcedureName(name: "Гигиеническая чистка детям", price: "1 200 ₽"),
            ProcedureName(name: "Удаление налета курильщика", price: "2 300 ₽"),
            ProcedureName(name: "Пигментационные пятна - ликвидация", price: "1 800 ₽"),
            ProcedureName(name: "Обучение гигиене полости рта", price: "600 ₽"),
            ProcedureName(name: "Плановая профилактика", price: "950 ₽"),
            ProcedureName(name: "Оптическое отбеливание", price: "7 600 ₽"),
            ProcedureName(name: "Комплексная профгигиена", price: "5 000 ₽"),
            ProcedureName(name: "Механическая чистка", price: "1 200 ₽"),
            ProcedureName(name: "Индивидуальный гигиенический комплекс", price: "2 900 ₽")
        ]
    ),
    MainAreas(
        name: "Имплантология",
        image: "Имплантология",
        allProceduresOfTheSpecialty: [
            ProcedureName(name: "Установка импланта", price: "30 000 ₽"),
            ProcedureName(name: "Консультация имплантолога", price: "1 000 ₽"),
            ProcedureName(name: "Планирование имплантации", price: "2 000 ₽"),
            ProcedureName(name: "Установка формирователя десны", price: "5 000 ₽"),
            ProcedureName(name: "Костная пластика", price: "18 000 ₽"),
            ProcedureName(name: "Синус-лифтинг", price: "15 000 ₽"),
            ProcedureName(name: "Протезирование на имплантах", price: "27 000 ₽"),
            ProcedureName(name: "Удаление импланта", price: "10 000 ₽"),
            ProcedureName(name: "Установка временной коронки на имплант", price: "8 000 ₽"),
            ProcedureName(name: "Установка циркониевой коронки на имплант", price: "26 000 ₽"),
            ProcedureName(name: "Направленная регенерация костной ткани", price: "19 000 ₽"),
            ProcedureName(name: "Коррекция мягких тканей", price: "7 500 ₽"),
            ProcedureName(name: "Лечение периимплантита", price: "7 000 ₽"),
            ProcedureName(name: "Установка мультиюнита", price: "6 500 ₽"),
            ProcedureName(name: "Пластика мягких тканей", price: "9 000 ₽"),
            ProcedureName(name: "Установка временного абатмента", price: "4 400 ₽")
        ]
    ),
    MainAreas(
        name: "Консультации",
        image: "Консультации",
        allProceduresOfTheSpecialty: [
            ProcedureName(name: "Первичный приём стоматолога", price: "1 100 ₽"),
            ProcedureName(name: "Повторная консультация", price: "900 ₽"),
            ProcedureName(name: "Составление плана лечения", price: "900 ₽"),
            ProcedureName(name: "Консультация смежного специалиста", price: "1 200 ₽"),
            ProcedureName(name: "Врачебный консилиум", price: "2 500 ₽"),
            ProcedureName(name: "Оформление справок", price: "700 ₽"),
            ProcedureName(name: "Консультация гигиениста", price: "600 ₽"),
            ProcedureName(name: "Выдача выписки из карты", price: "700 ₽"),
            ProcedureName(name: "Повторный приём после лечения", price: "700 ₽"),
            ProcedureName(name: "Консультация узкого специалиста", price: "1 200 ₽"),
            ProcedureName(name: "Подбор средств для домашнего ухода", price: "500 ₽"),
            ProcedureName(name: "Профилактический осмотр", price: "900 ₽"),
            ProcedureName(name: "Постановка диагноза", price: "700 ₽"),
            ProcedureName(name: "Видео-консультация", price: "1 000 ₽"),
            ProcedureName(name: "Дистанционная оценка снимков", price: "1 000 ₽")
        ]
    ),
    MainAreas(
        name: "Отбеливание и эстетика",
        image: "ОтбеливаниеИЭстетика",
        allProceduresOfTheSpecialty: [
            ProcedureName(name: "Офисное отбеливание Opalescence Boost", price: "13 000 ₽"),
            ProcedureName(name: "Домашнее отбеливание капами", price: "11 000 ₽"),
            ProcedureName(name: "Реминерализация эмали", price: "1 500 ₽"),
            ProcedureName(name: "Реставрация переднего зуба фотополимером", price: "5 500 ₽"),
            ProcedureName(name: "Композитные виниры", price: "14 000 ₽"),
            ProcedureName(name: "Керамические виниры", price: "23 000 ₽"),
            ProcedureName(name: "Икона инфильтрация (Icon)", price: "3 800 ₽"),
            ProcedureName(name: "Межзубное отбеливание", price: "2 700 ₽"),
            ProcedureName(name: "Эстетическая коррекция формы зуба", price: "6 000 ₽"),
            ProcedureName(name: "Ламинирование эмали", price: "7 000 ₽"),
            ProcedureName(name: "Покрытие фторлаком", price: "1 200 ₽"),
            ProcedureName(name: "Эстетическая коронка", price: "15 000 ₽"),
            ProcedureName(name: "Снятие пигментных пятен", price: "2 000 ₽"),
            ProcedureName(name: "Фторирование эмали", price: "1 200 ₽"),
            ProcedureName(name: "Художественная реставрация клыка", price: "5 800 ₽"),
            ProcedureName(name: "Моделирование улыбки", price: "6 400 ₽")
        ]
    ),
    MainAreas(
        name: "Анестезиология",
        image: "Анестезиология",
        allProceduresOfTheSpecialty: [
            ProcedureName(name: "Инфильтрационная анестезия", price: "600 ₽"),
            ProcedureName(name: "Проводниковая анестезия", price: "800 ₽"),
            ProcedureName(name: "Аппликационная анестезия", price: "300 ₽"),
            ProcedureName(name: "Парадентальная анестезия", price: "850 ₽"),
            ProcedureName(name: "Компьютерная анестезия", price: "1 400 ₽"),
            ProcedureName(name: "Седация (1 час)", price: "6 000 ₽"),
            ProcedureName(name: "Общая анестезия (1 час)", price: "15 000 ₽"),
            ProcedureName(name: "Детская седация (ингаляционная)", price: "4 500 ₽"),
            ProcedureName(name: "Местная анестезия ребенку", price: "500 ₽"),
            ProcedureName(name: "Лечение под наркозом", price: "от 19 000 ₽"),
            ProcedureName(name: "Предварительное обезболивание", price: "350 ₽"),
            ProcedureName(name: "Внутривенная анестезия", price: "3 700 ₽"),
            ProcedureName(name: "Контроль глубины наркоза", price: "2 000 ₽"),
            ProcedureName(name: "Минимальная седация (Мидазолам)", price: "2 700 ₽")
        ]
    ),
    MainAreas(
        name: "Рентген-диагностика",
        image: "РентгенДиагностика",
        allProceduresOfTheSpecialty: [
            ProcedureName(name: "Прицельный снимок зуба", price: "450 ₽"),
            ProcedureName(name: "Ортопантомограмма", price: "1 400 ₽"),
            ProcedureName(name: "Телерадиография", price: "1 900 ₽"),
            ProcedureName(name: "3D КТ (одна зона)", price: "2 000 ₽"),
            ProcedureName(name: "Расшифровка снимка", price: "400 ₽"),
            ProcedureName(name: "Фотопротокол (до/после)", price: "700 ₽"),
            ProcedureName(name: "Интраоральное фото", price: "300 ₽"),
            ProcedureName(name: "Печать снимка", price: "200 ₽"),
            ProcedureName(name: "Снимок на переносном рентгене", price: "850 ₽"),
            ProcedureName(name: "Выписка снимков на носитель", price: "300 ₽"),
            ProcedureName(name: "Ретгеноконтрактный снимок", price: "1 200 ₽"),
            ProcedureName(name: "Планирование операций по КТ", price: "1 600 ₽"),
            ProcedureName(name: "Телерентгенография суставов", price: "1 800 ₽"),
            ProcedureName(name: "Диагностика околоносовых пазух", price: "1 200 ₽"),
            ProcedureName(name: "Печать ОПТГ формата А3", price: "700 ₽"),
            ProcedureName(name: "Снимок височно-нижнечелюстного сустава", price: "1 000 ₽")
        ]
    )
]
