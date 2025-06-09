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
    @State private var registrationCompleted = false
    @State private var showPassword = false
    
    let genders = ["Мужской", "Женский"]
    
    private var isButtonActive: Bool {
        !name.isEmpty &&
        !surname.isEmpty &&
        !patronymic.isEmpty &&
        password.count >= 6 &&
        password == repeatPassword
    }
    
    var dateFormatter: DateFormatter {
        let f = DateFormatter()
        f.dateStyle = .long
        return f
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
                    
                    Text("Пароль").font(.caption).foregroundStyle(.secondary)
                    
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            CustomTextFieldView(placeholder: "Пароль", text: $password)
                        } else {
                            CustomSecureFieldView(placeholder: "Пароль", text: $password)
                        }
                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundStyle(.gray)
                        }
                        .padding(.trailing, 12)
                    }
                    
                    Text("Пароль должен содержать не менее 6 символов")
                        .foregroundStyle(.red)
                        .font(.caption)
                        .opacity(password.count < 6 ? 1 : 0)
                    
                    Text("Повторить пароль").font(.caption).foregroundStyle(.secondary)
                    
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            CustomTextFieldView(placeholder: "Пароль", text: $repeatPassword)
                        } else {
                            CustomSecureFieldView(placeholder: "Пароль", text: $repeatPassword)
                        }
                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundStyle(.gray)
                        }
                        .padding(.trailing, 12)
                    }
                    
                    Text("Пароли должны совпадать")
                        .foregroundStyle(.red)
                        .font(.caption)
                        .opacity(password != repeatPassword ? 1 : 0)
                    
                    NavigationLink(destination: RegistrationSuccessfulView(), isActive: $registrationCompleted) {
                        EmptyView()
                    }
                    
                    Button {
                        let user = User(
                            name: name,
                            surname: surname,
                            patronymic: patronymic,
                            gender: gender,
                            birthDate: birthDate,
                            phone: extractDigits(phoneNumber),
                            password: password)
                        _ = userVM.register(user)
                        registrationCompleted = true
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
    }
}

#Preview {
    RegistrationFormView(phoneNumber: "+79999999999")
        .environmentObject(UserViewModel())
}
