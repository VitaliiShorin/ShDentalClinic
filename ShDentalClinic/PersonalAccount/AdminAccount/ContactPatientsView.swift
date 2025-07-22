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
                    ForEach(callbackVM.sortedRequests) { request in
                        VStack(alignment: .leading) {
                            Text("\(request.surname) \(request.name)")
                                .font(.headline)
                            Text("Телефон: \(formattedPhoneNumber(request.phoneNumber))")
                                .foregroundStyle(.secondary)
                            Text("Дата и время: \(Self.formattedDate(request.created))")
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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    ContactPatientsView()
        .environmentObject(CallbackRequestsViewModel())
}
