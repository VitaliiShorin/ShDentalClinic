//
//  licenseView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 13.05.2025.
//

import SwiftUI

struct LicenseView: View {
    let licenses = ["license1", "license2"]
    
    var body: some View {
        TabView {
            ForEach(licenses, id: \.self) { license in
                VStack {
                    Image(license)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                }
                .padding()
                .shadow(radius: 5)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    LicenseView()
}
