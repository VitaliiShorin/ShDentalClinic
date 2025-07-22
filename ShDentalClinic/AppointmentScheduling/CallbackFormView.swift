//
//  CallbackFormView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 20.05.2025.
//

import SwiftUI

struct CallbackFormView: View {
    @State private var name = ""
    @State private var surname = ""
    @State private var phoneNumber = ""
    @State var showAlert = false
    
    @EnvironmentObject var callbackVM: CallbackRequestsViewModel
    
    private var isButtonActive: Bool {
        !name.isEmpty && !surname.isEmpty && phoneNumber.count >= 11
    }
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Введите имя", text: $name)
                .textFieldStyle(.roundedBorder)
            
            TextField("Введите фамилию", text: $surname)
                .textFieldStyle(.roundedBorder)
            
            TextField("Контактный номер", text: Binding(
                get: { formattedPhoneNumber(phoneNumber) },
                set: { phoneNumber = extractDigits($0) }
            ))
            .keyboardType(.phonePad)
            .textContentType(.telephoneNumber) // Предложение IOS по автозаполнению
            .textFieldStyle(.roundedBorder)
            
            Button {
                callbackVM.add(name: name, surname: surname, phoneNumber: phoneNumber)
                showAlert.toggle()
                clearForm()
            } label: {
                Text("Отправить")
                    .foregroundStyle(.white)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(isButtonActive ? .blue : .gray)
                    .animation(.easeInOut(duration: 0.2), value: isButtonActive)
                    .cornerRadius(15)
            }
            .disabled(!isButtonActive)
            .padding(.top)
            .alert("Заявка успешно отправлена!", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
        }
        .hideKeyboardOnTap()
    }
    
    private func clearForm() {
        name = ""
        surname = ""
        phoneNumber = ""
    }
}

#Preview {
    CallbackFormView()
        .environmentObject(CallbackRequestsViewModel())
}
