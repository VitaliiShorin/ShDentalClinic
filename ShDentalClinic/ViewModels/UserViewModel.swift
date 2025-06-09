//
//  UserViewModel.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 03.06.2025.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = [] {
        didSet { saveUsers() }
    }
    @Published var currentUserID: UUID? {
        didSet { saveCurrentUserID() }
    }
    
    var user: User? {
        guard let id = currentUserID else { return nil }
        return users.first(where: { $0.id == id })
    }

    private let usersKey = "users_list"
    private let currentUserKey = "current_user_id"
    
    init() {
        loadUsers()
        loadCurrentUserID()
        // Раскомментировать для удаления всех users
//        removeAllUsers()
    }
    
    func register(_ user: User) -> Bool {
        let exists = users.contains { $0.phone == user.phone }
        guard !exists else { return false }
        users.append(user)
        currentUserID = user.id
        return true
    }
    
    func checkCredentials(phone: String, password: String) -> Bool {
        guard let foundUser = users.first(where: { $0.phone == phone && $0.password == password }) else { return false }
        currentUserID = foundUser.id
        return true
    }

    func changePassword(oldPassword: String, newPassword: String) -> Bool {
        guard let id = currentUserID,
              let index = users.firstIndex(where: { $0.id == id }),
              users[index].password == oldPassword else { return false }
        objectWillChange.send()
        users[index].password = newPassword
        saveUsers()
        return true
    }

    func resetPassword(for phone: String, newPassword: String) -> Bool {
        guard let index = users.firstIndex(where: { $0.phone == phone }) else { return false }
        users[index].password = newPassword
        return true
    }
    
    func logout() {
        currentUserID = nil
    }
    
    func deleteCurrentUser() {
        guard let id = currentUserID else { return }
        users.removeAll { $0.id == id }
        currentUserID = nil
    }

    private func saveUsers() {
        if let data = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(data, forKey: usersKey)
        }
    }
    
    private func loadUsers() {
        if let data = UserDefaults.standard.data(forKey: usersKey),
           let saved = try? JSONDecoder().decode([User].self, from: data) {
            users = saved
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
        if let str = UserDefaults.standard.string(forKey: currentUserKey),
           let uuid = UUID(uuidString: str) {
            currentUserID = uuid
        }
    }
    
    // Для удаления всех users
    func removeAllUsers() {
        users = []
        currentUserID = nil // Чтобы сбросить текущего
    }
}
