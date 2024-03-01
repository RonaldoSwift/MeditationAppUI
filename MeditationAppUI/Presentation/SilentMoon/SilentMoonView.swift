//
//  SilentMoonView.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 5/02/24.
//

import SwiftUI

struct SilentMoonView: View {
    
    var onClickSignUp: () -> Void
    var onClickSignIn: () -> Void
    
    var body: some View {
        VStack {
            ZStack {
                Image(ImageResource.fondoSilentMoon)
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    HStack {
                        Text("S i l e n t")
                            .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                        Image(ImageResource.logo)
                        Text("M o o n")
                            .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                    }
                    .padding(.bottom, 30)
                    Image(ImageResource.imagenInici)
                }
                .padding(.bottom, 20)
            }
            
            Spacer()
            
            VStack {
                Text("We are what we do")
                    .font(.custom("HelveticaNeueCyr-Bold", size: 30))
                    .padding(.bottom, 10)
                
                VStack {
                    Text("Thousand of people are usign silent moon")
                        .padding(.bottom, 5)
                    Text("for smalls meditation")
                }
                .font(.custom("HelveticaNeueCyr-Thin", size: 16))
                .foregroundStyle(Color.colorLetras)
                
                generalButtonComponent(
                    onClickInSitioWeb: {
                        
                        onClickSignUp()
                        
                    },
                    textoDelButton: "SIGN UP"
                )
                .padding(.top,70)
                
                HStack {
                    Text("ALREADY HAVE AN ACCOUNT?")
                        .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                        .foregroundStyle(Color.colorLetras)
                    Button(action: {
                        
                        onClickSignIn()
                        
                    }, label: {
                        Text("LOG IN")
                            .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                            .foregroundColor(Color.colorButton)
                    })
                }
                .padding(.top, 20)
            }
            .padding(.bottom, 80)
            .padding()
        }
    }
}

#if DEBUG
struct SilentMoonView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            SilentMoonView(onClickSignUp: {}, onClickSignIn: {})
        }
    }
}
#endif
