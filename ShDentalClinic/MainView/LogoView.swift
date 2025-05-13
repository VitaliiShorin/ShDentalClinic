//
//  LogoView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 10.05.2025.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack {
            Image("logo2")
                .resizable()
                .scaledToFit()
                .shadow(radius: 3)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .padding(.top, 10)
        .shadow(radius: 1)
    }
}

#Preview {
    LogoView()
}
