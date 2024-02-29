//
//  WelcomeView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 28/02/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Color.accentBackground1
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image(ImageResource.welcome)
            }
            
            VStack(alignment: .center) {
                HStack {
                    Text("S i l e n t")
                        .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                    Image(ImageResource.logo)
                    Text("M o o n")
                        .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                }.padding(.bottom, 40)
                
                
                Text("Hi Asfar, Welcome")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 30))
                    .foregroundStyle(.accentLabel1)
                    
                Text("to Silent Moon")
                    .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 30))
                    .padding(.vertical, 2)
                    .foregroundStyle(.accentLabel1)
                Text("Explore the app, Find some peace of mind to prepare for meditation.")
                    .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 16))
                    .padding(.all, 20)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.accentLabel2)
                
                Spacer()
                
                generalButtonComponent(
                    onClickInSitioWeb: {
                    
                    },
                    textoDelButton: "GET STARTED"
                )
                
            }
            .padding(EdgeInsets(top: 5, leading: 30, bottom: 30, trailing: 30))
            
       
        }
    }
}

#Preview {
    WelcomeView()
}