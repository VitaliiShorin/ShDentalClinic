//
//  CustomButtonNLView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 28.05.2025.
//

import SwiftUI

struct CustomNLButtonView<Destination: View>: View {
    let text: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(text)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.green)
                .foregroundStyle(.white)
                .cornerRadius(15)
        }
    }
}

#Preview {
    CustomNLButtonView(text: "Далее", destination: EmptyView())
}
