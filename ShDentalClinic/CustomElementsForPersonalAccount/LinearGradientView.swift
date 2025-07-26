//
//  LinearGradientView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 28.05.2025.
//

import SwiftUI

struct LinearGradientView: View {
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.blue.opacity(0.3), .white]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

#Preview {
    LinearGradientView()
}
