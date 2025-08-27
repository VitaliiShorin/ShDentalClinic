//
//  RealmCallbackRequest.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 27.08.2025.
//

import Foundation
import RealmSwift

final class RealmCallbackRequest: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var name = ""
    @Persisted var surname = ""
    @Persisted var phoneNumber = ""
    @Persisted var created = Date()
}
