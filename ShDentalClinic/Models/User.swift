//
//  User.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 03.06.2025.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var surname: String
    var patronymic: String
    var gender: String
    var birthDate: Date
    var phone: String
    var password: String
}
