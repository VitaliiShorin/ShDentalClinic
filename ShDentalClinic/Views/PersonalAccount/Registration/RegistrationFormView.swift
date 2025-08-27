//
//  RegistrationFormView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 24.05.2025.
//

import SwiftUI

struct RegistrationFormView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    let phoneNumber: String
    
    @State private var name = ""
    @State private var surname = ""
    @State private var patronymic = ""
    @State private var gender = "Мужской"
    @State private var password = ""
    @State private var repeatPassword = ""
    @State private var birthDate = Date()
    @State private var showDatePicker = false
    
    let genders = ["Мужской", "Женский"]
    
    private var isButtonActive: Bool {
        !name.isEmpty &&
        !surname.isEmpty &&
        !patronymic.isEmpty &&
        password.count >= 6 &&
        password == repeatPassword
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.3)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Фамилия:").font(.caption).foregroundStyle(.secondary)
                    CustomTextFieldView(placeholder: "", text: $surname)
                    
                    Text("Имя:").font(.caption).foregroundStyle(.secondary)
                    CustomTextFieldView(placeholder: "", text: $name)
                    
                    Text("Отчество:").font(.caption).foregroundStyle(.secondary)
                    CustomTextFieldView(placeholder: "", text: $patronymic)
                    
                    Text("Пол:").font(.caption).foregroundStyle(.secondary)
                    
                    HStack {
                        ForEach(genders, id: \.self) { item in
                            Button(action: { gender = item }) {
                                Text(item)
                                    .padding()
                                    .font(.caption.bold())
                                    .background(gender == item ? .blue.opacity(0.5) : .clear)
                                    .cornerRadius(10)
                                    .foregroundStyle(gender == item ? .white : .secondary)
                            }
                        }
                    }
                    
                    Text("Дата рождения:").font(.caption).foregroundStyle(.secondary)
                    
                    Button {
                        showDatePicker.toggle()
                    } label: {
                        HStack {
                            Text(dateFormatter.string(from: birthDate))
                                .foregroundStyle(.primary)
                            
                            Spacer()
                            
                            Image(systemName: "calendar")
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                    .sheet(isPresented: $showDatePicker) {
                        VStack {
                            DatePicker("Дата рождения", selection: $birthDate, in: ...Date(), displayedComponents: .date)
                                .datePickerStyle(.graphical)
                                .labelsHidden()
                                .padding()
                            
                            Button("Готово") {
                                showDatePicker = false
                            }
                            .padding(.horizontal, 32)
                            .padding(.vertical, 12)
                            .foregroundStyle(.white)
                            .background(.green)
                            .cornerRadius(12)
                        }
                    }
                    
                    PasswordInputFieldView(
                        title: "Пароль:",
                        text: $password,
                        error: password.count < 6 ? "Пароль должен быть не менее 6 символов" : nil
                    )
                    
                    PasswordInputFieldView(
                        title: "Повторите пароль:",
                        text: $repeatPassword,
                        error: password != repeatPassword ? "Пароли должны совпадать" : nil
                    )
                    
                    Button {
                        let user = User(
                            id: UUID(),
                            name: name,
                            surname: surname,
                            patronymic: patronymic,
                            gender: gender,
                            birthDate: birthDate,
                            phone: extractDigits(phoneNumber),
                            password: password)
                        _ = userVM.register(user)
                    } label: {
                        Text("Зарегистрироваться")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isButtonActive ? .green : .gray)
                            .foregroundStyle(.white)
                            .cornerRadius(15)
                    }
                    .disabled(!isButtonActive)
                    .padding(.top, 10)
                    .padding(.bottom)
                }
            }
            .padding(.horizontal, 32)
        }
        .hideKeyboardOnTap()
    }
}

#Preview {
    RegistrationFormView(phoneNumber: "+79999999999")
        .environmentObject(UserViewModel())
}
