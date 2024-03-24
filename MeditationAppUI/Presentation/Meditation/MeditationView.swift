//
//  MeditationView.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 12/03/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct MeditationView: View {
    @State var isActiveReminderes: Bool = false
    @State private var showAlert: Bool = false
    @State private var textoDeAlert: String = ""
    @State private var showLoading: Bool = false
    @State private var listCategory: [CategoryMeditation] = []
    @State var url = URL(string: "https://via.placeholder.com/150x150.jpg")

    var meditationViewModel = MeditationViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("Meditate")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 30))
                    .padding(.bottom, 10)
                Text("We can learn how to recognize when our minds are doing their every acrobatics.")
                    .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 15))
                    .foregroundStyle(Color.colorLetras)

                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(listCategory, id: \.id) { (category: CategoryMeditation) in
                            VStack {
                                Button(action: {}, label: {
                                    var colorFinal = if category.activo == true {
                                        Color.colorButton
                                    } else {
                                        Color.colorLetras
                                    }

                                    WebImage(
                                        url: URL(string: category.icon)
                                    )
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .background(colorFinal)
                                    .cornerRadius(25)
                                })

                                var colorText = if category.activo == true {
                                    Color.black
                                } else {
                                    Color.colorLetras
                                }

                                Text(category.name)
                                    .foregroundStyle(colorText)
                            }
                        }
                    }
                    .padding()
                }

                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                    .mask(RoundedRectangle(cornerRadius: 12))
                    .frame(width: 374, height: 95)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                    VStack(alignment: .leading) {
                        ZStack {
                            Image(ImageResource.fondDailyCalm)
                                .padding(.bottom, 35)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Daily Calm")
                                        .foregroundStyle(Color.black)
                                        .font(.custom("HelveticaNeueCyr-Bold", size: 20))

                                    HStack {
                                        Text("APR 30 *")
                                        Text("PAUSE PRACTICE")
                                    }
                                    .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 12))
                                    .foregroundStyle(Color.colorLetras)
                                    .padding(.top, 5)
                                }
                                .padding(.trailing, 120)

                                Button(action: {}, label: {
                                    Image(ImageResource.playBlack)
                                })
                            }
                            .padding(.bottom, 40)
                        }
                        .padding()
                    }
                    .padding(.top, 38)
                    .frame(width: 374, height: 95)
                    .background(Color.accentBackgroundCard2)
                    .foregroundColor(Color.white)
                    .cornerRadius(12)
                }

                ScrollView(.vertical) {
                    VStack {
                        HStack(spacing: 20) {
                            Button(action: {
                                isActiveReminderes = true

                            }, label: {
                                ZStack {
                                    Image(ImageResource.daysOfCalm)
                                        .cornerRadius(10)
                                    Text("7 Days of Calm")
                                        .padding(.trailing, 10)
                                        .padding(.top, 140)
                                        .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 22))
                                        .foregroundColor(Color.white)
                                }
                            })

                            ZStack {
                                Image(ImageResource.anxietRelease)
                                    .cornerRadius(10)
                                Text("Anxiet Release")
                                    .padding(.trailing, 10)
                                    .padding(.top, 120)
                                    .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 22))
                                    .foregroundColor(Color.white)
                            }
                        }

                        HStack(spacing: 20) {
                            ZStack {
                                Image(ImageResource.dais)
                                    .cornerRadius(10)
                                Text("Summer")
                                    .padding(.trailing, 60)
                                    .padding(.top, 120)
                                    .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 22))
                                    .foregroundColor(Color.white)
                            }

                            ZStack {
                                Image(ImageResource.ambiente)
                                    .cornerRadius(10)
                                Text("Spring")
                                    .padding(.trailing, 80)
                                    .padding(.top, 180)
                                    .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 22))
                                    .foregroundColor(Color.white)
                            }
                        }
                    }
                }
            }
            .padding()
            .navigation(ReminderesView(), $isActiveReminderes)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error Category in FireBase"),
                    message: Text(textoDeAlert),
                    dismissButton: .default(
                        Text("Entendido"),
                        action: {
                            // Acción al presionar el botón "Entendido"
                        }
                    )
                )
            }
            .onReceive(meditationViewModel.$meditationUiState, perform: { meditationUiState in
                switch meditationUiState {
                case .initial:
                    break
                case .loading:
                    break
                case let .error(error):
                    print("Error \(error)")

                case let .success(listCategory):
                    self.listCategory = listCategory
                }
            })
            .onAppear(perform: {
                meditationViewModel.getCategorias()
            })
        }
    }
}

#Preview {
    MeditationView()
}
