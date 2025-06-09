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

            TextField("Контактный номер", text: $phoneNumber)
                .keyboardType(.phonePad)
                .textContentType(.telephoneNumber)
                .textFieldStyle(.roundedBorder)
            
            Button {
                callbackVM.add(name: name, surname: surname, phoneNumber: phoneNumber)
                name = ""
                surname = ""
                phoneNumber = ""
                showAlert.toggle()
                hideKeyboard()
            } label: {
                Text("Отправить")
                    .foregroundStyle(.white)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(isButtonActive ? .blue : .gray)
                    .cornerRadius(15)
            }
            .disabled(!isButtonActive)
            .padding(.top, 16)
            .alert("Заявка успешно отправлена!", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
        }
    }
    
    // Скрытие клавиатуры после отправки данных
    private func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

#Preview {
    CallbackFormView()
        .environmentObject(CallbackRequestsViewModel())
}
