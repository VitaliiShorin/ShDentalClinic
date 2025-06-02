//
//  CustomTextFieldView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 28.05.2025.
//

import SwiftUI

struct CustomTextFieldView: View {
    let placeholder: String
    @Binding var text: String
    
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
    }
}

#Preview {
    CustomTextFieldView(placeholder: "+7", text: .constant(""))
}
