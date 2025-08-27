//
//  OnlineBookingView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 21.05.2025.
//

import SwiftUI

struct OnlineBookingView: View {
    
    var body: some View {
        VStack {
            Text("Выберите специальность")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.top, 32)
            
            List(serviceCategories[0...9]) { item in
                NavigationLink(destination: DoctorsBySpecialtyView(specialty: item.name)) {
                    Text(item.name)
                        .font(.title3.bold())
                        .foregroundStyle(.blue)
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    OnlineBookingView()
}
