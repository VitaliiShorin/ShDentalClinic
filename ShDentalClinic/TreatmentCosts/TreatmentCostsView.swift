//
//  TreatmentCostsView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 17.05.2025.
//

import SwiftUI

struct TreatmentCostsView: View {
    
    var body: some View {
        List(serviceCategories) { item in
            NavigationLink(destination: ProceduresListView(area: item)) {
                HStack {
                    Image(item.image)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .padding(.trailing, 8)
                    Text(item.name)
                        .font(.title3.bold())
                }
                .padding(.vertical, 6)
            }
        }
        .navigationTitle("Выберите категорию")
    }
}

#Preview {
    TreatmentCostsView()
}
