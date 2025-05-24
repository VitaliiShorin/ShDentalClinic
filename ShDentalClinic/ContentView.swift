//
//  ContentView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 06.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TabView {
                MainView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Главная")
                    }
                AppointmentSchedulingView()
                    .tabItem {
                        Image(systemName: "plus.circle.fill")
                        Text("Запись на прием")
                    }
                Text("Информация")
                    .tabItem {
                        Image(systemName: "person")
                        Text("Профиль")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ReviewsViewModel())
        .environmentObject(BookedAppointmentsViewModel())
}
