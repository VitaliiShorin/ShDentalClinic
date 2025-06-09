//
//  ForgotPasswordView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 28.05.2025.
//

import SwiftUI
// Готов
struct ForgotPasswordView: View {
    @State private var phoneNumber = ""
    @State private var nextScreen = false
    
    private var isButtonActive: Bool {
        phoneNumber.count == 11
    }
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            VStack {
                Text("Сбросить пароль")
                    .font(.title3.bold())
                    .padding(.bottom)
                
                VStack(alignment: .leading)  {
                    Text("Укажите номер телефона:")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    CustomTextFieldView(placeholder: "+7", text: Binding(
                        get: { formattedPhoneNumber(phoneNumber) },
                        set: { newValue in self.phoneNumber = extractDigits(newValue) }
                    ))
                    .keyboardType(.phonePad)
                    
                    Button {
                        nextScreen.toggle()
                    } label: {
                        Text("Далее")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isButtonActive ? .green : .gray)
                            .foregroundStyle(.white)
                            .cornerRadius(15)
                    }
                    .disabled(!isButtonActive)
                    .padding(.top)
                                    
                    NavigationLink(
                        destination: SetNewPasswordView(),
                        isActive: $nextScreen
                    ) { EmptyView() }

                }
                .padding(.bottom)
                
                NavigationLink(
                    destination: WelcomeView()) {
                        Text("У меня есть логин и пароль: \nВойти")
                            .font(.footnote)
                            .foregroundStyle(.blue)
                            .frame(maxWidth: .infinity)
                    }
                
                Spacer()
            }
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    ForgotPasswordView()
}
