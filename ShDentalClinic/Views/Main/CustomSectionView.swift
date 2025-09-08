//
//  CustomSectionView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 09.05.2025.
//

import SwiftUI

enum Size {
    case big, medium, small
}

enum Direction {
    case horizontal, vertical
}

struct CustomSectionView: View {
    let text: String
    let imageName: String
    let screen: Screen
    let size: Size
    let direction: Direction
    
    var body: some View {
        createRectangleView(
            text: text,
            imageName: imageName,
            screen: screen,
            size: size,
            direction: direction
        )
    }
    
    private func createRectangleView(
        text: String,
        imageName: String,
        screen: Screen,
        size: Size,
        direction: Direction
    ) -> some View {
        return NavigationLink(destination: screen.view) {
            Group {
                if (direction == .horizontal && (size == .medium || size == .big)) {
                    HStack(alignment: .top) {
                        Text(text)
                            .font(.title3.bold())
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.black.opacity(0.85))
                            .padding(.top)
                            .padding(.leading, 24)
                        
                        Spacer()
                        
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 130, maxHeight: 130)
                            .padding(.trailing, 24)
                    }
                    .frame(maxHeight: 140)
                    
                } else if (direction == .vertical && size == .small) {
                    VStack {
                        Text(text)
                            .font(.title3.bold())
                            .foregroundStyle(.black.opacity(0.85))
                            .padding(.top)
                        
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 130, maxHeight: 130)
                            .padding(.bottom, 8)
                    }
                    .frame(maxWidth: 120, maxHeight: 140)
                    
                } else {
                    VStack {
                        Text(text)
                            .font(.title3.bold())
                            .foregroundStyle(.black.opacity(0.85))
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(maxHeight: 140)
                }
            }
            .frame(height: 140)
            .background(.main)
            .cornerRadius(15)
            .shadow(radius: 3)
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        CustomSectionView(
            text: "Записаться на прием",
            imageName: "ЗаписатьсяНаПрием",
            screen: .appointment,
            size: .big,
            direction: .horizontal
        )
        
        CustomSectionView(
            text: "Стоимость услуг",
            imageName: "СтоимостьУслуг",
            screen: .price,
            size: .big,
            direction: .horizontal
        )
        
        HStack(spacing: 16) {
            CustomSectionView(
                text: "Наши врачи",
                imageName: "НашиВрачи",
                screen: .ourDoctors,
                size: .medium,
                direction: .horizontal
            )
            CustomSectionView(
                text: "Отзывы",
                imageName: "ОтзывыОНас",
                screen: .reviews,
                size: .small,
                direction: .vertical
            )
        }
        
        CustomSectionView(
            text: "Адрес клиники и контакты",
            imageName: "АдресКлиникиИКонтакты",
            screen: .address,
            size: .big,
            direction: .horizontal
        )
    }
    .padding(.bottom)
    .padding(.top,8)
    .padding(.horizontal)
}
