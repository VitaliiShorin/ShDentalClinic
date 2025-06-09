//
//  CallbackRequestsViewModel.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 08.06.2025.
//

import Foundation

struct CallbackRequest: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let surname: String
    let phoneNumber: String
    let created: Date
}

class CallbackRequestsViewModel: ObservableObject {
    @Published var requests: [CallbackRequest] = [] {
        didSet { save() }
    }

    private let key = "callback_requests"

    init() {
        load()
    }

    func add(name: String, surname: String, phoneNumber: String) {
        let request = CallbackRequest(
            id: UUID(),
            name: name,
            surname: surname,
            phoneNumber: phoneNumber,
            created: Date()
        )
        requests.insert(request, at: 0) // Новое — сверху
    }

    private func save() {
        if let data = try? JSONEncoder().encode(requests) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let saved = try? JSONDecoder().decode([CallbackRequest].self, from: data) {
            requests = saved
        }
    }
    
    func clearAll() {
        requests.removeAll()
    }
}
