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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        Image("089")
                            .resizable()
                            .frame(width: geometry.size.width, height: geometry.size.width / 1.52)
                            .clipped()
                        Image("090")
                            .resizable()
                            .frame(width: geometry.size.width, height: geometry.size.width / 1.52)
                            .clipped()
                        Image("091")
                            .resizable()
                            .frame(width: geometry.size.width, height: geometry.size.width / 1.52)
                            .clipped()
                        Image("088")
                            .resizable()
                            .frame(width: geometry.size.width, height: geometry.size.width / 1.52)
                            .clipped()
                    }
                }
                
                HStack {
                    // Левая стрелка
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.white)
                        .opacity(0.5)
                        .font(.system(size: 30))
                        .frame(width: geometry.size.width / 7.9, height: geometry.size.width / 1.52, alignment: .center)
                    Spacer()
                    // Правая стрелка
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.white)
                        .opacity(0.5)
                        .font(.system(size: 30))
                        .frame(width: geometry.size.width / 7.9, height: geometry.size.width / 1.52, alignment: .center)
                }
            }
        }
    }
}

#Preview {
    PhotoOfTheCabinetView()
}
