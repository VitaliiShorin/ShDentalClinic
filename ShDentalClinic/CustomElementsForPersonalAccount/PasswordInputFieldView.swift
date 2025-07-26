//
//  PasswordInputFieldView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 16.07.2025.
//

import SwiftUI

struct PasswordInputFieldView: View {
    let title: String
    @Binding var text: String
    @State private var showPassword: Bool = false
    let error: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            ZStack(alignment: .trailing) {
                if showPassword {
                    CustomTextFieldView(placeholder: "", text: $text)
                } else {
                    CustomSecureFieldView(placeholder: "", text: $text)
                }
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundStyle(.gray)
                }
                .padding(.trailing, 12)
            }
            Text(error ?? " ")
                .foregroundStyle(.red.opacity((error != nil && !error!.isEmpty) ? 1 : 0))
                .font(.caption)
                .frame(minHeight: 16, alignment: .leading)
        }
    }
}

// Скрытие клавиатуры по тапу вне текстового поля
extension View {
    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
        }
    }
}

#Preview {
    PasswordInputFieldView(title: "", text: .constant(""), error: "")
}
