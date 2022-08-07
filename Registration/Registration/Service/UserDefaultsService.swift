//
//  UserDefaults.swift
//  Registration
//
//  Created by Igor Baidak on 7.08.22.
//

import Foundation

final class UserDefaultsService {
    static func saveUserModel(userModel: UserModel) {
        UserDefaults.standard.set(userModel.email, forKey: UserDefaults.Keys.email.rawValue)
        UserDefaults.standard.set(userModel.name, forKey: UserDefaults.Keys.name.rawValue)
        UserDefaults.standard.set(userModel.password, forKey: UserDefaults.Keys.password.rawValue)
    }
    static func getUserModel() -> UserModel? {
        let userName = UserDefaults.standard.string(forKey: UserDefaults.Keys.name.rawValue)
        guard let userEmail = UserDefaults.standard.string(forKey: UserDefaults.Keys.email.rawValue),
              let userPassword = UserDefaults.standard.string(forKey: UserDefaults.Keys.password.rawValue) else { return nil }
        let userModel = UserModel(name: userName, email: userEmail, password: userPassword)
        return userModel
    }
    static func deleteUserDefaults() {
        UserDefaults.standard.reset()
    }
    
}


