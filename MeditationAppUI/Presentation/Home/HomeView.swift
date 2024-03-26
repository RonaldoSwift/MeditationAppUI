//
//  HomeView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @State var isActivePlayMusic: Bool = false
    @State var isActiveHappyMorning: Bool = false
    @State var isActiveChooseTopic: Bool = false
    @State private var showAlert: Bool = false
    @State private var mensajeDeAlerta: String = ""
    @State private var showLoading: Bool = false

    @State private var listHomeCategory: [HomeMeditation] = []
    var homeViewModel = Injector.container.resolve(HomeViewModel.self)!
    @State var url = URL(string: "https://via.placeholder.com/150x150.jpg")
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                HStack {
                    Text("S i l e n t")
                        .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                    Image(ImageResource.logo)
                    Text("M o o n")
                        .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                }
                .padding(.bottom, 30)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Good Morning, Afsar")
                            .font(.custom("HelveticaNeueCyr-Bold", size: 30))
                            .padding(.bottom, 10)
                        Text("We Wish you have a good day")
                            .font(.custom("HelveticaNeueCyr-Medium", size: 20))
                            .foregroundStyle(Color.colorLetras)
                    }
                    Spacer()
                }
                
                HStack {
                    Button(action: {}, label: {
                        ZStack {
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                            )
                            .mask(RoundedRectangle(cornerRadius: 12))
                            .frame(width: 177, height: 210)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                            
                            VStack(alignment: .leading) {
                                Image(ImageResource.basicsCourse)
                                    .frame(width: 20, height: 20)
                                    .padding(.leading, 110)
                                Text("Basics")
                                    .padding(.top, 10)
                                    .font(.custom("HelveticaNeueCyr-Bold", size: 20))
                                Text("COURSE")
                                    .padding(.top, 5)
                                    .font(.custom("HelveticaNeueCyr-Medium", size: 15))
                                
                                Spacer()
                                HStack {
                                    Text("3-10 MIN")
                                    Button(action: {
                                        isActiveHappyMorning = true
                                        
                                    }, label: {
                                        Text("START")
                                            .font(.custom("HelveticaNeueCyr-Light", size: 15))
                                        
                                    })
                                    .padding(10)
                                    .foregroundColor(.black)
                                    .background(Color.primaryBackground)
                                    .cornerRadius(30)
                                }
                                .padding(.bottom, 20)
                            }
                            .padding(.top, 38)
                            .frame(width: 177, height: 210)
                            .background(Color.colorButton)
                            .foregroundColor(Color.accentLabel1)
                            .cornerRadius(12)
                        }
                    })
                    
                    Button(action: {}, label: {
                        ZStack {
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                            )
                            .mask(RoundedRectangle(cornerRadius: 12))
                            .frame(width: 177, height: 210)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                            
                            VStack(alignment: .leading) {
                                Image(ImageResource.relaxion)
                                    .frame(width: 20, height: 50)
                                    .padding(.leading, 65)
                                    .padding(.top, 80)
                                
                                VStack(alignment: .leading) {
                                    Text("Relaxation")
                                        .font(.custom("HelveticaNeueCyr-Bold", size: 20))
                                    Text("MUSIC")
                                        .font(.custom("HelveticaNeueCyr-Medium", size: 15))
                                }
                                .padding(.bottom, 10)
                                
                                HStack {
                                    Text("3-10 MIN")
                                    Button(action: {
                                        isActiveChooseTopic = true
                                        
                                    }, label: {
                                        Text("START")
                                            .font(.custom("HelveticaNeueCyr-Light", size: 15))
                                        
                                    })
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .background(Color.primaryLabel)
                                    .cornerRadius(30)
                                }
                                .padding(.bottom, 80)
                            }
                            .padding(.top, 38)
                            .frame(width: 177, height: 210)
                            .background(Color.accentBackgroundCard)
                            .foregroundColor(Color.primaryLabel)
                            .cornerRadius(12)
                        }
                    })
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
                            Image(ImageResource.dailyCard)
                                .padding(.bottom, 35)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Daily Thought")
                                        .font(.custom("HelveticaNeueCyr-Bold", size: 20))
                                    
                                    HStack {
                                        Text("MEDITATION *")
                                        Text("3-10 MIN")
                                    }
                                }
                                .padding(.trailing, 70)
                                
                                Button(action: {
                                    isActivePlayMusic = true
                                    
                                }, label: {
                                    Image(ImageResource.play)
                                })
                            }
                            .padding(.bottom, 40)
                        }
                        .padding()
                    }
                    .padding(.top, 38)
                    .frame(width: 374, height: 95)
                    .background(Color.primaryLabel)
                    .foregroundColor(Color.white)
                    .cornerRadius(12)
                }
                
                Text("Recomended for you")
                    .font(.custom("HelveticaNeueCyr-Bold", size: 25))
                    .padding(.trailing, 100)
                    .padding(.top, 20)
                
                ZStack(alignment: .center) {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(listHomeCategory, id: \.id) {(home: HomeMeditation) in
                                Button(action: {}, label: {
                                    VStack(alignment: .leading) {
                                        VStack(alignment: .leading) {
                                            
                                            WebImage(
                                                url: URL(string: home.icon)
                                            )
                                        }
                                        Text(home.mame)
                                            .font(.custom("HelveticaNeueCyr-Bold", size: 25))
                                            .foregroundColor(Color.black)
                                        Text(home.textMeditation)
                                            .font(.custom("HelveticaNeueCyr-Light", size: 13))
                                            .foregroundStyle(Color.colorLetras)
                                    }
                                })
                            }
                        }
                    }
                    
                    if showLoading == true {
                        ProgressView()
                    }
                }
            }
            .padding()
            .navigation(PlayMusicView(musicMediaplayer: MusicMediaPlayer()), $isActivePlayMusic)
            .navigation(HappyMorningView(), $isActiveHappyMorning)
            .navigation(ChooseTopicView(), $isActiveChooseTopic)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Fallo"),
                    message: Text(mensajeDeAlerta),
                    dismissButton: .default(
                        Text("Entendido"),
                        action: {
                            // Acción al presionar el botón "Entendido"
                        }
                    )
                )
            }
            .onReceive(homeViewModel.$homeUiState, perform: {homeUiState in
                switch homeUiState {
                case .initial:
                    break
                case .loading:
                    showLoading = true
                case let .error(mensajeDeError):
                    mensajeDeAlerta = mensajeDeError
                    showLoading = false
                    showAlert = true
                    
                case let .success(listHomeCategory):
                    self.listHomeCategory = listHomeCategory
                    showLoading = false

                }
            })
            .onAppear(perform: {
                homeViewModel.getCategorias()
            })
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Preview<HomeView> {
            HomeView()
        }
    }
}
#endif
