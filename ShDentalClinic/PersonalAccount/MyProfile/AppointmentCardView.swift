//
//  AppointmentCardView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 06.06.2025.
//

import SwiftUI

struct AppointmentCardView: View {
    let appointment: BookedAppointment
    let onCancel: (() -> Void)?
    
    @State private var showAlert = false
    @State private var isVisible = true
    
    var body: some View {
        if isVisible {
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Image(appointment.doctorImage)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 80, height: 80)
                    VStack(alignment: .leading) {
                        Text("Врач:")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text(appointment.doctorName)
                            .font(.callout.bold())
                            .foregroundStyle(.primary)
                    }
                    Spacer()
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Дата приема:")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text(Self.dateStr(appointment.date))
                            .font(.callout.bold())
                            .foregroundStyle(.primary)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Время:")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text(appointment.hour)
                            .font(.callout.bold())
                            .foregroundStyle(.primary)
                    }
                }
                .padding(.top, 6)
                
                Button {
                    showAlert.toggle()
                } label: {
                    Text("Отменить запись")
                        .foregroundStyle(.red)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Вы уверены, что хотите отменить запись?"),
                        primaryButton: .cancel(),
                        secondaryButton: .destructive(Text("Отменить запись"), action: animateCancel)
                    )
                }
            }
            .padding()
            .background(.white)
            .cornerRadius(15)
            .shadow(radius: 2)
            .transition(.scale.combined(with: .opacity))
            .animation(.easeInOut(duration: 0.4), value: isVisible)
        }
    }
    
    func animateCancel() {
        withAnimation(.easeInOut(duration: 0.4)) {
            isVisible = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            onCancel?()
        }
    }
    
    static func dateStr(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: date)
    }
}

#Preview {
    AppointmentCardView(
        appointment: BookedAppointment(
            id: UUID(),
            userID: UUID(),
            doctorName: "Иванов Иван Иванович",
            doctorImage: "Анатолий",
            date: Date(),
            hour: "14:30"
        ),
        onCancel: {}
    )
}
