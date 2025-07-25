//
//  CallbackRequestsViewModel.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 08.06.2025.
//

import Foundation
import RealmSwift

// MARK: - Model
final class RealmCallbackRequest: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var name = ""
    @Persisted var surname = ""
    @Persisted var phoneNumber = ""
    @Persisted var created = Date()
}

// MARK: - ViewModel
final class CallbackRequestViewModel: ObservableObject {
    @Published private(set) var requests: [RealmCallbackRequest] = []

    private let realm: Realm

    // MARK: - Initialization
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error.localizedDescription)")
        }
//        clearAll() // для тестирования
        load()
    }

    // MARK: - Computed Properties
    var sortedRequests: [RealmCallbackRequest] {
        requests.sorted { $0.created > $1.created }
    }

    // MARK: - Public Methods
    func add(name: String, surname: String, phoneNumber: String) {
        let request = RealmCallbackRequest()
        request.name = name
        request.surname = surname
        request.phoneNumber = phoneNumber
        
        do {
            try realm.write {
                realm.add(request)
            }
            load()
        } catch {
            print("Failed to add request: \(error.localizedDescription)")
        }
    }
    
    func load() {
        requests = Array(realm.objects(RealmCallbackRequest.self))
    }
    
    func clearAll() {
        do {
            try realm.write {
                let allRequests = realm.objects(RealmCallbackRequest.self)
                realm.delete(allRequests)
            }
            load()
        } catch {
            print("Failed to clear requests: \(error.localizedDescription)")
        }
    }
}
