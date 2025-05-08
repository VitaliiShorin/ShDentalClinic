//
//  MainView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 06.05.2025.
//

import SwiftUI

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                    
                    PhotoOfTheCabinetView()
                    
                    VStack(spacing: 16) {
                        CustomSectionView(
                            text: "Записаться на прием",
                            imageName: "ЗаписатьсяНаПрием",
                            screen: .test,
                            size: .big,
                            direction: .horizontal
                        )
                        
                        CustomSectionView(
                            text: "Стоимость услуг",
                            imageName: "СтоимостьУслуг",
                            screen: .test,
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
                                text: "Отзывы о нас",
                                imageName: "ОтзывыОНас",
                                screen: .test,
                                size: .small,
                                direction: .vertical
                            )
                        }
                        
                        CustomSectionView(
                            text: "Адрес клиники и контакты",
                            imageName: "АдресКлиникиИКонтакты",
                            screen: .test,
                            size: .big,
                            direction: .horizontal
                        )
                    }
                    .padding(.top,8)
                    .padding(.horizontal)
                }
                
            }
            .padding(.top)
            .padding(.bottom, 1)
            
        }
    }
}

#Preview {
    MainView()
}




