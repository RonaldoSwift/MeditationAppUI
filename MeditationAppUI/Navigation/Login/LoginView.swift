//
//  LoginView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        Button {
            withAnimation(.spring) {
                appRootManager.currentRoot = .principal
            }
        } label: {
            Text("LOGIN")
        }
    }
}

#Preview {
    LoginView()
}
