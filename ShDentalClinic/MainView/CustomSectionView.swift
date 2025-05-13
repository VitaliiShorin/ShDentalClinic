//
//  CustomSectionView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 09.05.2025.
//

import SwiftUI

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
}

enum Size {
    case big, medium, small
}

enum Direction {
    case horizontal, vertical
}

private func createRectangleView(
    text: String,
    imageName: String,
    screen: Screen,
    size: Size,
    direction: Direction
) -> some View {
    let width: CGFloat
    let height: CGFloat = UIScreen.main.bounds.height / 5.8

    switch size {
    case .big:
        width = UIScreen.main.bounds.width - 32
    case .medium:
        width = ((UIScreen.main.bounds.width - 16) * 0.6) - 16
    case .small:
        width = ((UIScreen.main.bounds.width - 16) * 0.4) - 16
    }

    return NavigationLink(destination: screen.view) {
        Group {
            if (direction == .horizontal && (size == .medium || size == .big)) {
                HStack {
                    Spacer()
                    Text(text)
                        .font(.title3.bold())
//                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.black)
                        .frame(
                            width: size == .big ? width / 2.3 : width / 3.2,
                            height: size == .big ? width / 2.5 : width / 1.5
                        )
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: size == .big ? width / 2.5 : width / 1.8,
                            height: size == .big ? width / 2.5 : width / 1.8
                        )
                    Spacer()
                }
            } else if (direction == .vertical && size == .small) {
                VStack {
                    Spacer()
                    Text(text)
                        .font(.title3.bold())
//                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.black)
                        .frame(width: width / 1.1, height: width / 3.7)
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: width / 1.7, height: width / 1.7)
                    Spacer()
                }
            } else {
                VStack {
                    Spacer()
                    Text(text)
                        .font(.title3.bold())
//                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.black)
                        .frame(width: width, height: width / 5)
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: width, height: width / 2.5)
                    Spacer()
                }
            }
        }
        .frame(width: width, height: height)
        .background(.main2)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

#Preview {
    CustomSectionView(
        text: "Отзывы",
        imageName: "ОтзывыОНас3",
        screen: .test1,
        size: .small,
        direction: .vertical
    )
}
