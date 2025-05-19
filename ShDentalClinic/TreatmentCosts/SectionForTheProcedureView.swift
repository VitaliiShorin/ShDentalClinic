//
//  SectionForTheProcedureView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 18.05.2025.
//

import SwiftUI
// Полностью переработан и готов
struct SectionForTheProcedureView: View {
    let procedure: ProcedureName

    var body: some View {
        HStack {
            Text(procedure.name)
                .font(.callout.bold())
                .foregroundStyle(.black)
                .frame(minHeight: 44, alignment: .leading)
            
            Spacer()
            
            Text(procedure.price)
                .font(.callout.bold())
                .foregroundStyle(.black)
                .padding(.leading)
        }
        .padding()
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

#Preview {
    SectionForTheProcedureView(
        procedure: serviceCategories[0].allProceduresOfTheSpecialty[0]
    )
}
