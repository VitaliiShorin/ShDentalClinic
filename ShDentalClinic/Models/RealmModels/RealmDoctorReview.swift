//
//  RealmDoctorReview.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 27.08.2025.
//

import Foundation
import RealmSwift

final class RealmDoctorReview: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var doctorFullName = ""
    @Persisted var patientName = ""
    @Persisted var date = Date()
    @Persisted var numberOfStars = 0
    @Persisted var reviewText = ""
}
