//
//  WelcomeView.swift
//  MeditationDarkAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 29/02/24.
//

import SwiftUI

struct DarkWelcomeView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        ZStack {
            Color.accentBackground1
                .ignoresSafeArea()
            
            Image(ImageResource.backgroundWelcome)
            
            VStack(alignment: .center) {
                
                Text("Welcome to Sleep")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 30))
                    .foregroundStyle(.primaryLabel)
                    .padding(.all, 10)
                  
                    
                Text("Explore the new king of sleep. It uses sound and visualization to create perfect conditions for refreshing sleep.")
                    .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 16))
                    .multilineTextAlignment(.center)
                    .lineSpacing(5)
                    .foregroundStyle(.secondaryLabel)
                    .padding(.all, 10)
                
                Image(ImageResource.sleepingBirds)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical, 60)
                
                
                PrimaryButton(text: "GET STARTED") {
                    
                }
    
            }
            .padding(EdgeInsets(top: 60, leading: 30, bottom: 60, trailing: 30))
        }
    }
}

#Preview {
    DarkWelcomeView()
}
