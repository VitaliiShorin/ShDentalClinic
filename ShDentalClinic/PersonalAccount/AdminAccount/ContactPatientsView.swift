//
//  ContactPatientsView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 06.06.2025.
//

import SwiftUI

struct ContactPatientsView: View {
    @EnvironmentObject var callbackVM: CallbackRequestsViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 8) {
                if callbackVM.requests.isEmpty {
                    Text("Заявок нет.")
                        .foregroundStyle(.secondary)
                        .padding()
                } else {
                    ForEach(callbackVM.requests.sorted { $0.created > $1.created }) { req in
                        VStack(alignment: .leading) {
                            Text("\(req.surname) \(req.name)")
                                .font(.headline)
                            Text("Телефон: \(formattedPhoneNumber(req.phoneNumber))")
                                .foregroundStyle(.secondary)
                            Text("Дата и время: \(Self.formattedDate(req.created))")
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(radius: 3)
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
        }
    }
    
    static func formattedDate(_ date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy HH:mm"
        return df.string(from: date)
    }
}

#Preview {
    ContactPatientsView()
        .environmentObject(CallbackRequestsViewModel())
}
