//
//  HomeView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
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
                                Button(action: {}, label: {
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
                                Button(action: {}, label: {
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

                            Button(action: {}, label: {
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

            ScrollView(.horizontal) {
                HStack {
                    Button(action: {}, label: {
                        VStack(alignment: .leading) {
                            ZStack {
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                                )
                                .mask(RoundedRectangle(cornerRadius: 12))
                                .frame(width: 162, height: 113)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                                VStack(alignment: .leading) {
                                    Image(ImageResource.focus)
                                        .padding(.bottom, 30)
                                }
                                .padding(.top, 38)
                                .frame(width: 162, height: 113)
                                .background(Color.accenteBackgroundCard3)
                                .foregroundColor(Color.accentLabel1)
                                .cornerRadius(12)
                            }

                            Text("Focus")
                                .font(.custom("HelveticaNeueCyr-Bold", size: 25))
                                .foregroundColor(Color.black)
                            Text("MEDITATION * 3-10 MIN")
                                .font(.custom("HelveticaNeueCyr-Light", size: 13))
                                .foregroundStyle(Color.colorLetras)
                        }
                    })

                    Button(action: {}, label: {
                        VStack(alignment: .leading) {
                            ZStack {
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                                )
                                .mask(RoundedRectangle(cornerRadius: 12))
                                .frame(width: 162, height: 113)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                                VStack(alignment: .leading) {
                                    Image(ImageResource.happiness)
                                        .padding(.bottom, 40)
                                }
                                .padding(.top, 38)
                                .frame(width: 162, height: 113)
                                .background(Color.accenteBackgroundCard4)
                                .foregroundColor(Color.accentLabel1)
                                .cornerRadius(12)
                            }

                            Text("Happiness")
                                .font(.custom("HelveticaNeueCyr-Bold", size: 25))
                                .foregroundColor(Color.black)
                            Text("MEDITATION * 3-10 MIN")
                                .font(.custom("HelveticaNeueCyr-Light", size: 13))
                                .foregroundStyle(Color.colorLetras)
                        }

                    })

                    Button(action: {}, label: {
                        VStack(alignment: .leading) {
                            ZStack {
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                                )
                                .mask(RoundedRectangle(cornerRadius: 12))
                                .frame(width: 162, height: 113)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                                VStack(alignment: .leading) {
                                    Image(ImageResource.focus)
                                        .padding(.bottom, 30)
                                }
                                .padding(.top, 38)
                                .frame(width: 162, height: 113)
                                .background(Color.accenteBackgroundCard3)
                                .foregroundColor(Color.accentLabel1)
                                .cornerRadius(12)
                            }

                            Text("Focus")
                                .font(.custom("HelveticaNeueCyr-Bold", size: 25))
                                .foregroundColor(Color.black)
                            Text("MEDITATION * 3-10 MIN")
                                .font(.custom("HelveticaNeueCyr-Light", size: 13))
                                .foregroundStyle(Color.colorLetras)
                        }

                    })
                }
            }
        }
        .padding()
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
