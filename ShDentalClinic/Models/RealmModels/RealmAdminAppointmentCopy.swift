//
//  RealmAdminAppointmentCopy.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 27.08.2025.
//

import Foundation
import RealmSwift

final class RealmAdminAppointmentCopy: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var patientFullName = ""
    @Persisted var patientPhone = ""
    @Persisted var doctorName = ""
    @Persisted var date = Date()
    @Persisted var hour = ""
}
