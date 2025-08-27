//
//  BookedAppointment+Extensions.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 27.08.2025.
//

import Foundation

extension RealmBookedAppointment {
    convenience init(
        id: UUID = UUID(),
        userID: UUID,
        doctorName: String,
        doctorImage: String,
        date: Date,
        hour: String
    ) {
        self.init()
        self.id = id
        self.userID = userID
        self.doctorName = doctorName
        self.doctorImage = doctorImage
        self.date = date
        self.hour = hour
    }
}
