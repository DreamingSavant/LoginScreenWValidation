//
//  LoginView.swift
//  LoginScreenWValidation
//
//  Created by Roderick Presswood on 3/4/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()

    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.purple.edgesIgnoringSafeArea(.all)
            
//            VStack(spacing: 20) {
                addTitleVStack()
                
               addLoginViewVStack()
//            }
//            .padding(.horizontal)
            
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Login Error"), message: Text(alertMessage), dismissButton: .default(Text("OK"), action: {
                viewModel.showAlert = false
            }))
        }
        
    }
    
    @ViewBuilder
    func addTitleVStack() -> some View {
        VStack(alignment: .leading) {
            Text("Welcome To My Swift Store")
                .foregroundStyle(Color.white)
                .font(.system(size: 42, design: .serif))
                .bold()
                .padding(.top, 40)
            Spacer()
        }
    }
    
    @ViewBuilder
    func addLoginViewVStack() -> some View {
        VStack(alignment: .leading) {
            Text("Login")
                .padding(.bottom, 15)
                .padding(.leading, 10)
                .padding(.top, 20)
                .font(.system(size: 42, design: .serif))
                .bold()
            
            CustomTextField(title: "Email", image: UIImage(systemName: "envelope") ?? .add, placeHolderText: "Enter Email here", isShowButtonHidden: true, isTextVisible: true, field: $viewModel.email)
                .padding(.bottom, 10)
            
            CustomTextField(title: "Password", image: UIImage(systemName: "lock") ?? .add, placeHolderText: "Enter Password here", isShowButtonHidden: false, field: $viewModel.password)
                .padding(.bottom, 40)
            
            CustomButtonView(isFilledButton: true, action: {
                login()
            })
            .disabled(!viewModel.isFormValid)
            .padding(.bottom, 20)
            
            
            
            CustomButtonView(isFilledButton: false, action: {
                createAnAccount()
            })
            .padding(.bottom, 30)
            
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        
        .background(Color.white)
        .cornerRadius(20)
        //            .frame(alignment: .bottom)
        .edgesIgnoringSafeArea(.bottom)
        .padding(.top, 250)
    }
    
    func login() {
        
    }
    
    func createAnAccount() {
        
    }
   
}

#Preview {
    LoginView()
}
