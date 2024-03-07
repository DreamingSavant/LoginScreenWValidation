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
                
                guard email.contains("@"), email.contains(".") else {
                    self.alertMessage = "Please enter a valid email address."
                    return false
                }
                
                guard password.count >= 8 else {
                    self.alertMessage = "Password must be at least 8 characters long."
                    return false
                }
                
                return true
            }
            .assign(to: \.isFormValid, on: self)
            .store(in: &cancellables)
        
        $isFormValid
            .receive(on: RunLoop.main)
            .map { $0 == false }
            .assign(to: \.showAlert, on: self)
            .store(in: &cancellables)
    }
    
//    func validateInputs() -> Bool {
//        if viewModel.email.isEmpty || viewModel.password.isEmpty {
//            alertMessage = "Please enter both email and password."
//            showingAlert = true
//            viewModel.isFormValid = false
//            return false
//        }
//        
//        if !viewModel.email.contains("@") || !viewModel.email.contains(".") {
//            alertMessage = "Please enter a valid email address."
//            showingAlert = true
//            viewModel.isFormValid = false
//            return false
//        }
//        
//        if viewModel.password.count < 8 {
//            alertMessage = "Password must be at least 8 characters long."
//            showingAlert = true
//            viewModel.isFormValid = false
//            return false
//        }
//        
//        showingAlert = false
//        viewModel.isFormValid = true
//        return true
//    }
    
//    func isValidEmail(_ email: String) -> Bool {
//        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailPattern)
//        return emailPred.evaluate(with: email)
//    }
}
