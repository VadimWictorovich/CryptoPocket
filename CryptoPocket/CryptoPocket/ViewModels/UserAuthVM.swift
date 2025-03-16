//
//  UserAuthVM.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 11.03.25.
//

import Foundation


final class AuthViewModel {
    
    func login (login: String, password: String) -> Bool {
        if login == "1234" && password == "1234" {
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            return true
        } else {
            return false
        }
    }
}
