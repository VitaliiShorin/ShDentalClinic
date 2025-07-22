//
//  DoctorsBySpecialtyView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 22.05.2025.
//

import SwiftUI

struct DoctorsBySpecialtyView: View {
    let specialty: String
    
    @State private var selectedDate = Date()
    @EnvironmentObject var appointmentVM: BookedAppointmentsViewModel
    
    private var calendar: Calendar { Calendar.current }
    
    private var weekDay: Int {
        calendar.component(.weekday, from: selectedDate)
    }
    
    private var filteredDoctors: [Doctor] {
        doctors.filter { doctor in
            doctor.relatedSpecialties.contains(specialty)
            && doctor.workingDays.contains(weekDay)
            && doctor.availableHours.contains(where: { hour in
                guard !appointmentVM.isHourBooked(doctor: doctor, date: selectedDate, hour: hour) else { return false }
                if Calendar.current.isDate(selectedDate, inSameDayAs: Date()) {
                    if let slotDate = timeSlotDate(for: hour, on: selectedDate) {
                        return slotDate > Date()
                    }
                    return false
                }
                return true
            })
        }
    }
    
    var body: some View {
        VStack {
            DateSelectionView(selectedDate: $selectedDate)
            
            ScrollView {
                if filteredDoctors.isEmpty {
                    Text("Свободное время для записи отсутствует. Выберите другую дату.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding()
                } else {
                    ForEach(filteredDoctors, id: \.id) { doctor in
                        ChoosingADoctorForAnAppointmentView(doctor: doctor, selectedDate: $selectedDate)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                    }
                }
            }
        }
        .navigationTitle(specialty)
    }
}

#Preview {
    DoctorsBySpecialtyView(specialty: doctors[0].relatedSpecialties[0])
        .environmentObject(BookedAppointmentsViewModel())
}
