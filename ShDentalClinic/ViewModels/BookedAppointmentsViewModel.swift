//
//  BookedAppointmentsViewModel.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 22.05.2025.
//

import Foundation
import RealmSwift

// MARK: - Model
final class BookedAppointment: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var userID = UUID()
    @Persisted var doctorName = ""
    @Persisted var doctorImage = ""
    @Persisted var date = Date()
    @Persisted var hour = ""
}

// MARK: - ViewModel
final class BookedAppointmentsViewModel: ObservableObject {
    @Published private(set) var bookedAppointments: [BookedAppointment] = []
    
    private let realm: Realm
    
    // MARK: - Initialization
    init() {
        do {
            realm = try Realm()
            bookedAppointments = Array(realm.objects(BookedAppointment.self))
//        removeAllAppointments() // для тестирования
        } catch {
            fatalError("Failed to initialize Realm: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Public Methods
    func add(_ appointment: BookedAppointment) {
        do {
            try realm.write {
                realm.add(appointment)
            }
            load()
        } catch {
            print("Failed to add appointment: \(error.localizedDescription)")
        }
    }
    
    func remove(_ appointment: BookedAppointment) {
        guard let existingAppointment = realm.object(ofType: BookedAppointment.self, forPrimaryKey: appointment.id) else {
            return
        }
        
        do {
            try realm.write {
                realm.delete(existingAppointment)
            }
            load()
        } catch {
            print("Failed to remove appointment: \(error.localizedDescription)")
        }
    }
    
    func isHourBooked(doctor: Doctor, date: Date, hour: String) -> Bool {
        bookedAppointments.contains {
            $0.doctorName == doctor.fullName &&
            Calendar.current.isDate($0.date, inSameDayAs: date) &&
            $0.hour == hour
        }
    }
    
    func appointments(for userID: UUID) -> [BookedAppointment] {
        bookedAppointments
            .filter { $0.userID == userID }
            .sorted { $0.date < $1.date }
    }
    
    func removeAllAppointments() {
        do {
            try realm.write {
                let allAppointments = realm.objects(BookedAppointment.self)
                realm.delete(allAppointments)
            }
            load()
        } catch {
            print("Failed to remove all appointments: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Private Methods
    private func load() {
            bookedAppointments = Array(realm.objects(BookedAppointment.self))
        }
}
