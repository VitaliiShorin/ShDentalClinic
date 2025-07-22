//
//  AdminAccountView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 02.06.2025.
//

import SwiftUI

struct AdminAccountView: View {
    @State var selection = 0
    @State private var showAlert = false
    @State private var navigateToWelcome = false
    @EnvironmentObject var callbackVM: CallbackRequestsViewModel
    @EnvironmentObject var appointmentCopyStorage: AdminAppointmentsCopyStorage
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.square")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.blue)
                
                Text("Администратор")
                    .font(.title2.bold())
                
                Spacer()
                
                NavigationLink(
                    destination: WelcomeView().navigationBarBackButtonHidden(true),
                    isActive: $navigateToWelcome
                ) { EmptyView() }
                
                Button {
                    navigateToWelcome.toggle()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                }
            }
            .padding([.horizontal, .top])
            
            Picker("", selection: $selection) {
                Text("Связаться с пациентами").tag(0)
                Text("Все записи на прием").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .padding(.bottom, 5)
            
            if selection == 0 {
                ContactPatientsView()
            } else {
                AllAppointmentsView()
            }
            
            Button {
                showAlert.toggle()
            } label: {
                Text("Очистить список")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
                    .foregroundStyle(.white)
                    .cornerRadius(15)
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Вы уверены, что хотите очистить список?"),
                    primaryButton: .cancel(),
                    secondaryButton: .destructive(Text("Очистить"), action: {
                        if selection == 0 {
                            callbackVM.clearAll()
                        } else {
                            appointmentCopyStorage.clearAll()
                        }
                    })
                )
            }
        }
    }
}

#Preview {
    AdminAccountView()
        .environmentObject(CallbackRequestsViewModel())
        .environmentObject(AdminAppointmentsCopyStorage())
}
