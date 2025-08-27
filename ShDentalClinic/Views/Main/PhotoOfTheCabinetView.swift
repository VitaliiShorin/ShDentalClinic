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
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(["01", "02", "03"], id: \.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(maxHeight: .infinity)
                    }
                }
            }
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.white)
                    .opacity(0.6)
                    .font(.system(size: 30))
                    .frame(width: 44, height: 44)
                    .padding(.leading, 12)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white)
                    .opacity(0.6)
                    .font(.system(size: 30))
                    .frame(width: 44, height: 44)
                    .padding(.trailing, 12)
            }
            .frame(maxHeight: .infinity)
        }
        .aspectRatio(1.52, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    PhotoOfTheCabinetView()
}
