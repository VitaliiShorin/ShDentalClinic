//
//  PasswordChangedSuccessfullyView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 29.05.2025.
//

import SwiftUI
// Готов
struct PasswordChangedSuccessfullyView: View {
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.green)
                    .padding()
                
                Text("Пароль успешно изменен")
                    .font(.title3.bold())
                
                CustomNLButtonView(text: "Готово", destination: WelcomeView())
                    .padding(.top, 32)
                
                Spacer()
                
            }
            .padding(.horizontal, 32)
            .padding(.top, 32)
        }
        
    }
}

#Preview {
    PasswordChangedSuccessfullyView()
}
