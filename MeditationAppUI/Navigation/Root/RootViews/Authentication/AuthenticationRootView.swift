//
//  AuthenticationRootView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import SwiftUI

struct AuthenticationRootView: View {
    
    @State var isActiveSignUp: Bool = false
    @State var isActiveSignIn: Bool = false
    
    var body: some View {
        NavigationView{
            SilentMoonView {
                isActiveSignUp = true
            } onClickSignIn: {
                isActiveSignIn = true
            }
            .navigation(SignUpView(), $isActiveSignUp)
            .navigation(SignInView(), $isActiveSignIn)
            
        }
    }
}

#Preview {
    AuthenticationRootView()
}
