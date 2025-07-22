//
//  CallTheClinicView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 20.05.2025.
//

import SwiftUI

struct CallTheClinicView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                Text("Записаться на прием к специалисту Вы можете позвонив по телефону:")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                createSection(
                    image: "phone",
                    title: "Телефон:",
                    information: "+7 (915) 154-**-**"
                )
                createSection(
                    image: "calendar.badge.checkmark",
                    title: "Режим работы:",
                    information: "По будням: 9:00-20:00\nСуббота: 9:00-19:00\nВоскресенье: 09:00-17:00"
                )
                
                Text("Также можете оставить заявку и мы свяжемся с Вами:")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.top, 16)
                
                CallbackFormView()
            }
            .padding()
            .padding(.top)
        }
        .hideKeyboardOnTap()
    }
    
    private func createSection(
        image: String,
        title: String,
        information: String
    ) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: image)
                    .foregroundStyle(.blue)
                Text(title)
                    .font(.body.bold())
            }
            .padding(.bottom, 2)
            
            Text(information)
                .font(.callout)
                .padding(.leading, 12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    CallTheClinicView()
        .environmentObject(CallbackRequestsViewModel())
}
