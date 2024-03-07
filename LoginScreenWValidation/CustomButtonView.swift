//
//  LoginButtonView.swift
//  LoginScreenWValidation
//
//  Created by Roderick Presswood on 3/4/24.
//

import SwiftUI

struct CustomButtonView: View {
    
    var isFilledButton: Bool = true
    var action: () -> ()
    
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
            .foregroundStyle(.purple)
        } else {
            Button {
                action()
            } label: {
                Text("Log In")
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .edgesIgnoringSafeArea(.all)
//                    .background(Color.purple)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding([.leading, .trailing], 20)
            
        }
    }
}

#Preview {
    CustomButtonView( action: {})
}
