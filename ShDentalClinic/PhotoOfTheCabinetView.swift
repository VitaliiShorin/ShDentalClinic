//
//  PhotoOfTheCabinetView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 06.05.2025.
//

import SwiftUI

struct PhotoOfTheCabinetView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ZStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 5) {
                            ForEach(["001", "002", "003", "004"], id: \.self) { imageName in
                                Image(imageName)
                                    .resizable()
                                    .frame(width: geometry.size.width, height: geometry.size.width / 1.52)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .opacity(0.5)
                            .font(.system(size: 30))
                            .frame(width: geometry.size.width / 7.9, height: geometry.size.width / 1.52)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white)
                            .opacity(0.5)
                            .font(.system(size: 30))
                            .frame(width: geometry.size.width / 7.9, height: geometry.size.width / 1.52)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.width / 1.52)
                }
            }
        }
        .frame(height: UIScreen.main.bounds.width / 1.52)
    }
}

#Preview {
    PhotoOfTheCabinetView()
}
