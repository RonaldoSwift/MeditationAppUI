//
//  SignInView.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 6/02/24.
//

import SwiftUI

struct SignInView: View {
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""

    @State var isActiveSignUp: Bool = false
    @State private var showLoading: Bool = false
    @State private var showAlert: Bool = false

    @EnvironmentObject private var appRootManager: AppRootManager

    @StateObject private var signInViewModel = SignInViewModel(
        authenticationRepository: AuthenticationRepository(
            fireBaseAuthDataSource: FireBaseAuthDataSource()
        )
    )

    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Image(ImageResource.signInFondo)
                    .ignoresSafeArea()
                VStack {
                    Text("Welcome Back!")
                        .font(.custom("HelveticaNeueCyr-Bold", size: 28))
                        .padding(.bottom, 10)

                    Button(action: {
                        print("Button Facebook")
                    }, label: {
                        HStack(alignment: .center) {
                            Image(ImageResource.logoFacebook)
                                .padding(.trailing, 40)
                            Text("CONTINUE WITH FACEBOOK")
                        }
                        .padding(EdgeInsets(top: 20, leading: 55, bottom: 20, trailing: 55))
                        .font(.custom("HelveticaNeueCyr-Bold", size: 14))
                        .foregroundColor(.white)
                        .background(Color.colorButtonFacebook)
                        .cornerRadius(40)

                    })

                    Button(action: {
                        print("Button Googler")

                    }, label: {
                        HStack {
                            Image(ImageResource.logoGoogle)
                                .padding(.trailing, 30)
                            Text("CONTINUE WITH GOOGLE")
                                .padding(.trailing, 30)
                        }
                        .padding(EdgeInsets(top: 20, leading: 45, bottom: 20, trailing: 45))
                        .font(.custom("HelveticaNeueCyr-Medium", size: 14))
                        .foregroundColor(.black)
                        .overlay(
                            Capsule(style: .circular)
                                .stroke(Color.colorButtonGoogle, style: StrokeStyle(lineWidth: 2))
                        )
                    })
                    .padding(.top, 10)
                }
                .padding(.top, 60)

                if showLoading {
                    ProgressView()
                }
            }

            Spacer()

            VStack {
                Text("OR LOG IN WITH EMAIL")
                    .font(.custom("HelveticaNeueCyr-Medium", size: 14))
                    .foregroundStyle(Color.colorLetras)
                    .padding(.bottom, 40)

                TextField("Email address", text: $emailTextField)
                    .padding()
                    .background(Color.colorSignInTextField)
                    .cornerRadius(10)
                    .padding(.bottom, 10)

                SecureField("Password", text: $passwordTextField)
                    .padding()
                    .background(Color.colorSignInTextField)
                    .cornerRadius(10)
                    .padding(.bottom, 20)

                generalButtonComponent(onClickInSitioWeb: {
                    signInViewModel.signIn(
                        correo: emailTextField,
                        pasword: passwordTextField
                    )

                }, textoDelButton: "Log In")

                Text("Forgot Password?")
                    .font(.custom("HelveticaNeueCyr-Medium", size: 14))
                    .padding(.top, 10)

                HStack {
                    Text("ALREADY HAVE AN ACCOUNT?")
                        .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                        .foregroundStyle(Color.colorLetras)
                    Button(action: {
                        isActiveSignUp = true

                    }, label: {
                        Text("SIGN UP")
                            .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                            .foregroundColor(Color.colorButton)
                    })
                }
                .padding(.top, 90)
                .padding(.bottom, 35)
            }
            .padding()
        }
        .navigation(SignUpView(), $isActiveSignUp)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Transefrencia a otros bancos"),
                message: Text("Error generico, usar el verdadero error."),
                dismissButton: .default(
                    Text("Entendido"),
                    action: {
                        // Acción al presionar el botón "Entendido"
                    }
                )
            )
        }
        .onReceive(signInViewModel.$signInState, perform: { signInState in
            switch signInState {
            case .initial:
                break
            case .loading:
                showLoading = true
            case let .error(error):
                print("Error  \(error)")
                showAlert = true
            case let .success(user):
                appRootManager.currentRoot = .principal
            }
        })
    }
}

#if DEBUG
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                SignInView()
            }
        }
    }
#endif
