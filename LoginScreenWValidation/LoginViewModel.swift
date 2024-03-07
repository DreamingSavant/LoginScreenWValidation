//
//  LoginViewModel.swift
//  LoginScreenWValidation
//
//  Created by Roderick Presswood on 3/5/24.
//

import Combine
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isFormValid = false
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        Publishers.CombineLatest($email, $password)
            .map { email, password in
                guard !email.isEmpty, !password.isEmpty else {
                    self.alertMessage = "Please enter both email and password."
                    return false
                }
                
                guard email.contains("@"), email.contains(".") && self.isValidEmail(email) else {
//                    self.alertMessage = "Please enter a valid email address."
                    return false
                }
                
                guard password.count >= 8 else {
//                    self.alertMessage = "Password must be at least 8 characters long."
                    return false
                }
                
                self.alertMessage = "You are now logged in!"
                return true
            }
            .assign(to: \.isFormValid, on: self)
            .store(in: &cancellables)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        self.alertMessage = "Please enter a valid email address."
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        if password.count <= 8  {
            self.alertMessage = "Password must be at least 8 characters long."
            return false
        } else if password == email {
            self.alertMessage = "Password must not be the same as email."
            return false
        } else {
            return true
        }
    }
}
