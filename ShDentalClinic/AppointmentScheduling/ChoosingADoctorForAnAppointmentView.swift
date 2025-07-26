//
//  ChoosingADoctorForAnAppointmentView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 20.05.2025.
//

import SwiftUI

struct ChoosingADoctorForAnAppointmentView: View {
    let doctor: Doctor
    let gridColumns = Array(repeating: GridItem(), count: 4)
    
    @Binding var selectedDate: Date
    @State var showAlert = false
    @State private var showAuthAlert = false
    @State private var selectedHour: String? = nil
    @State private var isShowingConfirmation = false
    
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var appointmentVM: BookedAppointmentsViewModel
    @EnvironmentObject var appointmentCopyStorage: AdminAppointmentCopyStorage
    
    var body: some View {
        VStack {
            HStack {
                Image(doctor.imageName)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 140, height: 140)
                    .padding(.trailing)
                
                VStack(alignment: .leading) {
                    Text(doctor.surname)
                        .font(.callout.bold())
                    Text(doctor.name)
                        .font(.callout.bold())
                    Text(doctor.patronymic)
                        .font(.callout.bold())
                    Text(doctor.speciality)
                        .font(.footnote)
                        .padding(.top, 8)
                }
                Spacer()
            }
            
            Divider()
                .background(.primary)
            
            Text("Выберите удобное время:")
                .font(.subheadline.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: gridColumns) {
                ForEach(
                    doctor.availableHours.filter { hour in
                        guard !appointmentVM.isHourBooked(
                            doctor: doctor,
                            date: selectedDate,
                            hour: hour
                        ) else { return false }
                        if Calendar.current.isDate(selectedDate, inSameDayAs: Date()) {
                            if let slotDate = Date().timeSlotDate(for: hour, on: selectedDate) {
                                return slotDate > Date()
                            }
                            return false
                        }
                        return true
                    },
                    id: \.self) { hour in
                    Button(action: {
                        if userVM.user == nil {
                            showAuthAlert.toggle()
                        } else {
                            selectedHour = hour
                            isShowingConfirmation.toggle()
                        }
                    }) {
                        Text(hour)
                            .font(.callout.bold())
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(.white)
                            .foregroundStyle(.blue)
                            .cornerRadius(5)
                            .shadow(radius: 2)
                    }
                }
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 4)
        .confirmationDialog(
            "Вы уверены, что хотите выбрать это время?",
            isPresented: $isShowingConfirmation,
            titleVisibility: .visible
        ) {
            if let hour = selectedHour, let user = userVM.user {
                Button("Подтвердить запись на \(hour)") {
                    let newAppointment = BookedAppointment(
                        userID: user.id,
                        doctorName: doctor.fullName,
                        doctorImage: doctor.imageName,
                        date: selectedDate,
                        hour: hour
                    )
                    appointmentVM.add(newAppointment)
                    appointmentCopyStorage.addCopy(patient: user, appointment: newAppointment)
                    showAlert = true
                    selectedHour = nil
                }
            }
            Button("Отмена", role: .cancel) {}
        }
        .alert("Запись успешно выполнена!", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
        .alert("Пожалуйста, зайдите в личный кабинет", isPresented: $showAuthAlert) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    ChoosingADoctorForAnAppointmentView(doctor: doctors[2], selectedDate: .constant(Date()))
        .environmentObject(BookedAppointmentsViewModel())
}
