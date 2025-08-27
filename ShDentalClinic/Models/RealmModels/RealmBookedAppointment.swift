//
//  RealmBookedAppointment.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 27.08.2025.
//

import Foundation
import RealmSwift

final class RealmBookedAppointment: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var userID = UUID()
    @Persisted var doctorName = ""
    @Persisted var doctorImage = ""
    @Persisted var date = Date()
    @Persisted var hour = ""
}
