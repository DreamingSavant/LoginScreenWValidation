//
//  PasswordUserNameTextField.swift
//  LoginScreenWValidation
//
//  Created by Roderick Presswood on 3/4/24.
//

import SwiftUI

struct PasswordUserNameTextField: View {
    var title: String
    var image: UIImage = .add
    var placeHolderText: String
    var isShowButtonHidden: Bool = false
    @State var isTextVisible: Bool = false
    @State var field: String = ""
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(uiImage: image)
                Text(title)
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
            
            HStack {
                if isTextVisible {
                    TextField(placeHolderText, text: $field)
                        .padding(.leading)
                } else {
                    SecureField(placeHolderText, text: $field)
                        .padding(.leading)
                }
                
                if !isShowButtonHidden {
                    Button(isTextVisible ? "Hide" : "Show") {
                        isTextVisible
                            .toggle()
                    }
                    .foregroundStyle(.blue)
                }
            }
            .padding(.trailing)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.purple.opacity(0.4))
                .padding(.leading, 16)
                .padding(.trailing, 16)
                
            if !isShowButtonHidden {
                HStack {
                    Button("Forgot password?") {
                    }
                    .padding(.leading)
                    Spacer()
                }
                .padding(.top, 10)
               
            }
        }
    }
}

#Preview {
    PasswordUserNameTextField(title: "Email", placeHolderText: "Enter String", field: "")
}
