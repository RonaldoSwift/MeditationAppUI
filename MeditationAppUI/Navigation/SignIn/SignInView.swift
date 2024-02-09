//
//  SignInView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        Button {
            withAnimation(.spring) {
                appRootManager.currentRoot = .principal
            }
        } label: {
            Text("SIGN IN")
        }
    }
}

#Preview {
    SignInView()
}
