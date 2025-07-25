//
//  AdminAppointmentCopyViewModel.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 08.06.2025.
//

import Foundation
import RealmSwift

// MARK: - Model
final class RealmAdminAppointmentCopy: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var patientFullName = ""
    @Persisted var patientPhone = ""
    @Persisted var doctorName = ""
    @Persisted var date = Date()
    @Persisted var hour = ""
}

// MARK: - ViewModel
final class AdminAppointmentCopyStorage: ObservableObject {
    @Published private(set) var copiedAppointments: [RealmAdminAppointmentCopy] = []

    private let realm: Realm

    // MARK: - Initialization
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error.localizedDescription)")
        }
//        clearAll() // для тестирования
        load()
    }

    // MARK: - Public Methods
    func addCopy(patient: User, appointment: BookedAppointment) {
        guard realm.object(ofType: RealmAdminAppointmentCopy.self, forPrimaryKey: appointment.id) == nil else {
            return
        }
        
        let copy = RealmAdminAppointmentCopy()
        copy.id = appointment.id
        copy.patientFullName = "\(patient.surname) \(patient.name) \(patient.patronymic)"
        copy.patientPhone = patient.phone
        copy.doctorName = appointment.doctorName
        copy.date = appointment.date
        copy.hour = appointment.hour
        
        do {
            try realm.write {
                realm.add(copy)
            }
            load()
        } catch {
            print("Failed to add appointment copy: \(error.localizedDescription)")
        }
    }
    
    func clearAll() {
        do {
            try realm.write {
                let allAppointments = realm.objects(RealmAdminAppointmentCopy.self)
                realm.delete(allAppointments)
            }
            load()
        } catch {
            print("Failed to clear appointments: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Private Methods
    private func load() {
        let objects = realm.objects(RealmAdminAppointmentCopy.self)
        copiedAppointments = Array(objects)
    }
}
