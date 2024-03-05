//
//  LoginView.swift
//  LoginScreenWValidation
//
//  Created by Roderick Presswood on 3/4/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String
    @State var password: String
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.purple.edgesIgnoringSafeArea(.all) 
            
            VStack(alignment: .leading) {
                Text("Welcome To My Swift Store")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 42, design: .serif))
                    .bold()
                    .padding(.top, 40)
                Spacer()
            }

            VStack(alignment: .leading) {
//                Spacer()
                // Content you want at the bottom
                Text("Login")
                    .padding(.bottom, 15)
                    .padding(.leading, 10)
                    .padding(.top, 20)
                    .font(.system(size: 42, design: .serif))
                    .bold()
                
                PasswordUserNameTextField(title: "Email/UserName", image: UIImage(systemName: "person") ?? .add, placeHolderText: "Enter UserName/Email here", isShowButtonHidden: true, isTextVisible: true, field: username)
                    .padding(.bottom, 10)
                
                PasswordUserNameTextField(title: "Password", image: UIImage(systemName: "key") ?? .add, placeHolderText: "Enter Password here", isShowButtonHidden: false, field: password)
                    .padding(.bottom, 40)
                
                CustomButtonView(isFilledButton: true)
                    .padding(.bottom, 20)
                CustomButtonView(isFilledButton: false)
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
    }
}

#Preview {
    LoginView(username: "", password: "")
}
