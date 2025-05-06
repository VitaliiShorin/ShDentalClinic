//
//  MainView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 06.05.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
            
            PhotoOfTheCabinetView()
            
            Spacer()

        }
    }
}
#Preview {
    MainView()
}
