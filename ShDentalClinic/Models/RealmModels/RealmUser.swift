//
//  RealmUser.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 27.08.2025.
//

import Foundation
import RealmSwift

final class RealmUser: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var name = ""
    @Persisted var surname = ""
    @Persisted var patronymic = ""
    @Persisted var gender = ""
    @Persisted var birthDate = Date()
    @Persisted var phone = ""
    @Persisted var password = ""
}
