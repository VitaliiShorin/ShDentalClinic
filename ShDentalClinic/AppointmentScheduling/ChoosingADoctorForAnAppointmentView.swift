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
    let width = UIScreen.main.bounds.width - 32
    
    @Binding var selectedDate: Date
    @State var showAlert = false
    @State private var selectedHour: String? = nil
    @State private var isShowingConfirmation = false
    
    @EnvironmentObject var appointmentVM: BookedAppointmentsViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image(doctor.imageName)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: width / 2.5, height: width / 2.5)
                    .padding(.trailing)
                
                VStack(alignment: .leading) {
                    Text(doctor.fullName)
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
                ForEach(doctor.availableHours.filter { hour in
                    !appointmentVM.isHourBooked(doctor: doctor, date: selectedDate, hour: hour)
                }, id: \.self) { hour in
                    Button(action: {
                        selectedHour = hour
                        isShowingConfirmation.toggle()
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
        .frame(width: width)
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 4)
        .confirmationDialog(
            "Вы уверены, что хотите выбрать это время?",
            isPresented: $isShowingConfirmation,
            titleVisibility: .visible
        ) {
            if let hour = selectedHour {
                Button("Подтвердить запись на \(hour)")  {
                    let newAppointment = BookedAppointment(
                        doctorName: doctor.fullName,
                        date: selectedDate,
                        hour: hour
                    )
                    appointmentVM.add(newAppointment)
                    showAlert = true
                    selectedHour = nil
                }
            }
            Button("Отмена", role: .cancel) {}
        }
        .alert("Запись успешно выполнена!", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    ChoosingADoctorForAnAppointmentView(doctor: doctors[2], selectedDate: .constant(Date()))
        .environmentObject(BookedAppointmentsViewModel())
}
