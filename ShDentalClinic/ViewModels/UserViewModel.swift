//
//  UserViewModel.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 03.06.2025.
//

import Foundation
import RealmSwift

// MARK: - Model
final class RealmUser: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var name = ""
    @Persisted var surname = ""
    @Persisted var patronymic = ""
    @Persisted var gender = ""
    @Persisted var birthDate = Date()
    @Persisted var phone = ""
    @Persisted var password = ""
}

struct User {
    let id: UUID
    let name: String
    let surname: String
    let patronymic: String
    let gender: String
    let birthDate: Date
    let phone: String
    let password: String
}

// MARK: - ViewModel
final class UserViewModel: ObservableObject {
    @Published private(set) var users: [User] = []
    @Published private(set) var currentUserID: UUID?

    private let realm: Realm
    private let currentUserKey = "current_user_id"

    var user: User? {
        guard let id = currentUserID else { return nil }
        return users.first(where: { $0.id == id })
    }

    // MARK: - Initialization
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
        loadUsers()
        loadCurrentUserID()
//        removeAllUsers() // для тестирования
    }

    // MARK: - Public Methods
    func register(_ user: User) -> Bool {
        guard realm.object(ofType: RealmUser.self, forPrimaryKey: user.id) == nil,
              !realm.objects(RealmUser.self).contains(where: { $0.phone == user.phone })
        else { return false }
        
        let realmUser = realmUser(from: user)
        do {
            try realm.write { realm.add(realmUser) }
        } catch {
            print("Realm write error: \(error.localizedDescription)")
            return false
        }
        loadUsers()
        currentUserID = user.id
        saveCurrentUserID()
        return true
    }

    func checkCredentials(phone: String, password: String) -> Bool {
        if let realmUser = realm.objects(RealmUser.self).first(where: { $0.phone == phone && $0.password == password }) {
            currentUserID = realmUser.id
            saveCurrentUserID()
            return true
        }
        return false
    }

    func changePassword(oldPassword: String, newPassword: String) -> Bool {
        guard let id = currentUserID,
              let realmUser = realm.object(ofType: RealmUser.self, forPrimaryKey: id),
              realmUser.password == oldPassword else { return false }
        
        do {
            try realm.write { realmUser.password = newPassword }
        } catch {
            print("Realm write error: \(error.localizedDescription)")
            return false
        }
        loadUsers()
        return true
    }

    func resetPassword(for phone: String, newPassword: String) -> Bool {
        if let realmUser = realm.objects(RealmUser.self).first(where: { $0.phone == phone }) {
            do {
                try realm.write { realmUser.password = newPassword }
            } catch {
                print("Realm write error: \(error.localizedDescription)")
                return false
            }
            loadUsers()
            return true
        }
        return false
    }

    func logout() {
        currentUserID = nil
        saveCurrentUserID()
    }

    func deleteCurrentUser() {
        guard let id = currentUserID,
              let realmUser = realm.object(ofType: RealmUser.self, forPrimaryKey: id) else { return }
        do {
            try realm.write { realm.delete(realmUser) }
        } catch {
            print("Realm write error: \(error.localizedDescription)")
            return
        }
        currentUserID = nil
        saveCurrentUserID()
        loadUsers()
    }
    
    func removeAllUsers() {
        do {
            try realm.write { realm.delete(realm.objects(RealmUser.self)) }
        } catch {
            print("Realm write error: \(error.localizedDescription)")
        }
        users = []
        currentUserID = nil
        saveCurrentUserID()
    }

    // MARK: - Private Methods
    private func loadUsers() {
        let realmUsers = realm.objects(RealmUser.self)
        self.users = realmUsers.map {
            User(id: $0.id,
                 name: $0.name,
                 surname: $0.surname,
                 patronymic: $0.patronymic,
                 gender: $0.gender,
                 birthDate: $0.birthDate,
                 phone: $0.phone,
                 password: $0.password)
        }
    }
    
    private func saveCurrentUserID() {
        if let id = currentUserID {
            UserDefaults.standard.set(id.uuidString, forKey: currentUserKey)
        } else {
            UserDefaults.standard.removeObject(forKey: currentUserKey)
        }
    }
    
    private func loadCurrentUserID() {
        if let userIDString = UserDefaults.standard.string(forKey: currentUserKey),
           let uuid = UUID(uuidString: userIDString) {
            currentUserID = uuid
        }
    }
    
    private func realmUser(from user: User) -> RealmUser {
        let realmUser = RealmUser()
        realmUser.id = user.id
        realmUser.name = user.name
        realmUser.surname = user.surname
        realmUser.patronymic = user.patronymic
        realmUser.gender = user.gender
        realmUser.birthDate = user.birthDate
        realmUser.phone = user.phone
        realmUser.password = user.password
        return realmUser
    }
}
