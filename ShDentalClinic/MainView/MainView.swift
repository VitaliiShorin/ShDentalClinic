//
//  MainView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 06.05.2025.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                LogoView()
                
                PhotoOfTheCabinetView()
                
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
            
        }
        .padding(.top)
        .padding(.bottom, 1)
        
    }
}


#Preview {
    MainView()
}
