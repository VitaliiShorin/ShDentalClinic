//
//  CustomSecureFieldView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 29.05.2025.
//

import SwiftUI

struct CustomSecureFieldView: View {
    let placeholder: String
    @Binding var text: String

    var body: some View {
            SecureField(placeholder, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
    }
}

#Preview {
    CustomSecureFieldView(placeholder: "+7", text: .constant(""))
}
