//
//  ContentView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 06.05.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        TabView {
            NavigationView {
                MainView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Главная")
            }
            NavigationView {
                AppointmentSchedulingView()
            }
            .tabItem {
                Image(systemName: "plus.circle.fill")
                Text("Запись на прием")
            }
            NavigationView {
                if let _ = userVM.user {
                    PersonalAccountView()
                } else {
                    WelcomeView()
                }
            }
            .tabItem {
                Image(systemName: "person")
                Text("Профиль")
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ReviewViewModel())
        .environmentObject(BookedAppointmentsViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(CallbackRequestViewModel())
        .environmentObject(AdminAppointmentCopyStorage())
}
