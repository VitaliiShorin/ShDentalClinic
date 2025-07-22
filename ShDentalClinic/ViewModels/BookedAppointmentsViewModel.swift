//
//  BookedAppointmentsViewModel.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 22.05.2025.
//

import Foundation

struct BookedAppointment: Codable, Identifiable, Hashable {
    let id: UUID
    let userID: UUID
    let doctorName: String
    let doctorImage: String
    let date: Date
    let hour: String

    init(id: UUID = UUID(), userID: UUID, doctorName: String, doctorImage: String, date: Date, hour: String) {
        self.id = id
        self.userID = userID
        self.doctorName = doctorName
        self.doctorImage = doctorImage
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
    
    func appointments(for userID: UUID) -> [BookedAppointment] {
        bookedAppointments
            .filter { $0.userID == userID }
            .sorted { $0.date < $1.date }
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

/// Возвращает объект Date, объединяя заданную дату с временем, указанным в строке hour (формат "HH:mm").
/// Если строка времени некорректна — возвращает nil.
/// - Parameters:
/// - hour: Время в формате "HH:mm" (например, "09:30").
/// - date: Дата, к которой нужно подставить указанное время.
/// - Returns: Объединённая дата и время в виде объекта Date или nil, если строка времени неверная.
func timeSlotDate(for hour: String, on date: Date) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    guard let time = formatter.date(from: hour) else { return nil }
    let calendar = Calendar.current
    var comps = calendar.dateComponents([.year, .month, .day], from: date)
    let hourMin = calendar.dateComponents([.hour, .minute], from: time)
    comps.hour = hourMin.hour
    comps.minute = hourMin.minute
    return calendar.date(from: comps)
}
