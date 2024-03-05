//
//  LoginButtonView.swift
//  LoginScreenWValidation
//
//  Created by Roderick Presswood on 3/4/24.
//

import SwiftUI

struct CustomButtonView: View {
    
    var isFilledButton: Bool = false
    
    var body: some View {
        if !isFilledButton {
            Button {
            } label: {
                Text("Create Account")
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .buttonStyle(.borderless)
            .controlSize(.large)
            .padding([.leading, .trailing], 20)
        } else {
            Button {
            } label: {
                Text("Log In")
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding([.leading, .trailing], 20)
        }
    }
}

#Preview {
    CustomButtonView()
}
