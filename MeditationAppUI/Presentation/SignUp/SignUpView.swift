//
//  SignUpView.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 8/02/24.
//

import SwiftUI

struct SignUpView: View {
    @State var nameTextField: String = ""
    @State var emailTextField: String = ""
    @State var passwordTextField: String = ""

    @State private var precionarCkeck = false
    @State var isActiveSignIn: Bool = false
    @State private var showLoading: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMensaje: String = ""

    @EnvironmentObject private var appRootManager: AppRootManager

    @StateObject private var signUpViewModel = SignUpViewModel(
        authenticationRepository: AuthenticationRepository(
            fireBaseAuthDataSource: FireBaseAuthDataSource(), memoriaLogin: MemoriaLogin()
        )
    )

    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Image(ImageResource.signInFondo)
                    .ignoresSafeArea()
                VStack {
                    Text("Create your account")
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
                .padding(.top, 100)
            }

            Spacer()

            VStack {
                Text("OR LOG IN WITH EMAIL")
                    .font(.custom("HelveticaNeueCyr-Medium", size: 14))
                    .foregroundStyle(Color.colorLetras)
                    .padding(.bottom, 40)

                TextField("Name", text: $nameTextField)
                    .padding()
                    .background(Color.colorSignInTextField)
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                    .overlay(
                        HStack(alignment: .center) {
                            Spacer()
                            Image(ImageResource.checkSinUp)
                                .resizable()
                                .frame(width: 20, height: 15)
                                .foregroundColor(Color.colorCheck)
                                .padding(.trailing, 20)
                        }
                    )

                TextField("Email address", text: $emailTextField)
                    .padding()
                    .background(Color.colorSignInTextField)
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                    .overlay(
                        HStack(alignment: .center) {
                            Spacer()
                            Image(ImageResource.checkSinUp)
                                .resizable()
                                .frame(width: 20, height: 15)
                                .foregroundColor(Color.colorCheck)
                                .padding(.trailing, 20)
                        }
                    )
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $passwordTextField)
                    .padding()
                    .background(Color.colorSignInTextField)
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                    .overlay(
                        HStack(alignment: .center) {
                            Spacer()
                            Image(ImageResource.tabSignUp)
                                .resizable()
                                .frame(width: 20, height: 15)
                                .padding(.trailing, 20)
                        }
                    )

                HStack(alignment: .center) {
                    Text("i have read the")
                        .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                        .foregroundStyle(Color.colorLetras)
                    Button(action: {
                        print("click Next Sign Up")
                    }, label: {
                        Text("Privace Policy")
                            .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                            .foregroundColor(Color.colorButton)
                    })

                    Spacer()

                    Button(action: {
                        precionarCkeck.toggle()
                    }, label: {
                        Image(systemName: precionarCkeck ? "checkmark.square.fill" : "square")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(precionarCkeck ? .green : Color.colorLetras)
                    })
                }
                .padding(.top, 10)
                .padding(.bottom, 35)

                generalButtonComponent(onClickInSitioWeb: {
                    signUpViewModel.signUp(
                        email: emailTextField,
                        password: passwordTextField
                    )
                }, textoDelButton: "GET STARTED")
                    .padding(.bottom, 60)
            }
            .padding()
        }
        .navigation(SignInView(), $isActiveSignIn)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error SignUp"),
                message: Text(alertMensaje),
                dismissButton: .default(
                    Text("Entendido"),
                    action: {
                        // Acción al presionar el botón "Entendido"
                    }
                )
            )
        }
        .onReceive(signUpViewModel.$signUpState, perform: { signUpState in
            switch signUpState {
            case .initial:
                break
            case .loading:
                showLoading = true
            case let .error(error):
                print("Error  \(error)")
                showAlert = true
                alertMensaje = error
            case let .success(user):
                appRootManager.currentRoot = .principal
            }
        })
    }
}

#if DEBUG
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                SignUpView()
            }
        }
    }
#endif
