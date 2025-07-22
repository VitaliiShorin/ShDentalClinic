//
//  ProceduresListView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 18.05.2025.
//

import SwiftUI

struct ProceduresListView: View {
    let area: MainAreas

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(area.allProceduresOfTheSpecialty) { procedure in
                    SectionForTheProcedureView(procedure: procedure)
                        .padding(.horizontal)
                }
            }
            .padding(.top)
            .padding(.bottom, 25)
        }
        .navigationTitle(area.name)
    }
}

#Preview {
    ProceduresListView(area: serviceCategories[0])
}
