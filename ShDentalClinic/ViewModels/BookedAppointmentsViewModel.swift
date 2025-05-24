//
//  BookedAppointmentsViewModel.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 22.05.2025.
//

import Foundation

struct BookedAppointment: Codable, Identifiable, Hashable {
    let id: UUID
    let doctorName: String
    let date: Date
    let hour: String

    init(id: UUID = UUID(), doctorName: String, date: Date, hour: String) {
        self.id = id
        self.doctorName = doctorName
        self.date = date
        self.hour = hour
    }
}

class BookedAppointmentsViewModel: ObservableObject {
    @Published var bookedAppointments: [BookedAppointment] = [] {
        didSet { save() }
    }

    private let key = "booked_appointments"
    
    // Для удаления забронированного времени
        init() { load() }
//    init() {
//        self.bookedAppointments = []
//        save()
//    }
    
    func add(_ appointment: BookedAppointment) {
        bookedAppointments.append(appointment)
    }
    
    func remove(_ appointment: BookedAppointment) {
        bookedAppointments.removeAll { $0 == appointment }
    }
    
    func isHourBooked(doctor: Doctor, date: Date, hour: String) -> Bool {
        bookedAppointments.contains {
            $0.doctorName == doctor.fullName &&
            Calendar.current.isDate($0.date, inSameDayAs: date) &&
            $0.hour == hour
        }
    }

    private func save() {
        if let data = try? JSONEncoder().encode(bookedAppointments) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let loaded = try? JSONDecoder().decode([BookedAppointment].self, from: data) {
            self.bookedAppointments = loaded
        }
    }
}
