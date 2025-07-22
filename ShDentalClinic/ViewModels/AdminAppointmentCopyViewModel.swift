//
//  AdminAppointmentCopyViewModel.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 08.06.2025.
//

import Foundation

struct AdminAppointmentCopy: Identifiable, Codable, Hashable {
    let id: UUID
    let patientFullName: String
    let patientPhone: String
    let doctorName: String
    let date: Date
    let hour: String
}

class AdminAppointmentsCopyStorage: ObservableObject {
    @Published var copiedAppointments: [AdminAppointmentCopy] = [] {
        didSet { save() }
    }
    
    private let key = "admin_appointments_copy"
    
        init() {
            load()
        }
//    init() {
//        self.copiedAppointments = []
//        save()
//    }
    
    func addCopy(patient: User, appointment: BookedAppointment) {
        let copy = AdminAppointmentCopy(
            id: appointment.id,
            patientFullName: "\(patient.surname) \(patient.name) \(patient.patronymic)",
            patientPhone: patient.phone,
            doctorName: appointment.doctorName,
            date: appointment.date,
            hour: appointment.hour
        )
        if !copiedAppointments.contains(where: { $0.id == appointment.id }) {
            copiedAppointments.append(copy)
        }
    }
    
    func clearAll() {
        copiedAppointments.removeAll()
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(copiedAppointments) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let loaded = try? JSONDecoder().decode([AdminAppointmentCopy].self, from: data) {
            self.copiedAppointments = loaded
        }
    }
}
