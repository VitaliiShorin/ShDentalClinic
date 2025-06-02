//
//  RegistrationSuccessfulView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 02.06.2025.
//

import SwiftUI

struct RegistrationSuccessfulView: View {
    
    
    var body: some View {
        VStack(spacing: 50) {
            Image("Registration")
                .resizable()
                .scaledToFit()
            
            Text("Вы зарегистрированы!")
                .font(.title2.bold())
            
            CustomNLButtonView(text: "В личный кабинет", destination: PersonalAccountView())
            
            Spacer()
        }
        .padding(50)
    }
}

#Preview {
    RegistrationSuccessfulView()
}
