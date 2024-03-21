//
//  ChooseTopicView.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 18/03/24.
//

import SwiftUI

struct ChooseTopicView: View {
    init() {
        let navBarAppearence = UINavigationBarAppearance() // use as global variable, otherwise SwiftUI may cause problems.
        navBarAppearence.configureWithTransparentBackground()
        navBarAppearence.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = navBarAppearence
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearence
    }

    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Image(ImageResource.chooseFondo)
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("What Brings you")
                            .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 25))
                            .padding(.top, 55)
                            .padding(.bottom, 5)

                        Text("to Silent Moon?")
                            .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 20))

                        Text("choose a topic to focuse on:")
                            .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 15))
                            .foregroundStyle(Color.colorLetras)
                            .padding(.top, 5)
                    }
                    .padding(.leading, 10)

                    ScrollView(.vertical) {
                        HStack {
                            ZStack {
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                                )
                                .mask(RoundedRectangle(cornerRadius: 12))
                                .frame(width: 176, height: 210)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                                VStack(alignment: .leading) {
                                    ZStack {
                                        Image(ImageResource.reduceStress)
                                            .padding(.bottom, 110)
                                            .cornerRadius(10)
                                        Text("Reduce Stress")
                                            .padding(.trailing, 20)
                                            .padding(.top, 110)
                                            .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 18))
                                            .foregroundColor(Color.white)
                                    }
                                }
                                .padding(.top, 38)
                                .frame(width: 176, height: 210)
                                .background(Color.accentBackground1)
                                .foregroundColor(Color.white)
                                .cornerRadius(12)
                            }

                            ZStack {
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                                )
                                .mask(RoundedRectangle(cornerRadius: 12))
                                .frame(width: 176, height: 167)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                                VStack(alignment: .leading) {
                                    ZStack {
                                        Image(ImageResource.improvePerformace)
                                            .padding(.bottom, 100)
                                            .cornerRadius(10)
                                        VStack(alignment: .leading) {
                                            Text("Improve")
                                            Text("Performance")
                                        }
                                        .padding(.trailing, 20)
                                        .padding(.top, 70)
                                        .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 18))
                                        .foregroundColor(Color.white)
                                    }
                                }
                                .padding(.top, 38)
                                .frame(width: 176, height: 167)
                                .background(Color.accentBackgroundCard6)
                                .foregroundColor(Color.white)
                                .cornerRadius(12)
                            }
                        }
                        HStack {
                            ZStack {
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                                )
                                .mask(RoundedRectangle(cornerRadius: 12))
                                .frame(width: 176, height: 167)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                                VStack(alignment: .leading) {
                                    ZStack {
                                        Image(ImageResource.incraseHappiness)
                                            .padding(.bottom, 110)
                                            .cornerRadius(10)

                                        VStack(alignment: .leading) {
                                            Text("Increase")
                                            Text("Happiness")
                                        }
                                        .padding(.trailing, 50)
                                        .padding(.top, 70)
                                        .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 18))
                                        .foregroundColor(Color.black)
                                    }
                                }
                                .padding(.top, 38)
                                .frame(width: 176, height: 167)
                                .background(Color.accentBackgroundCard7)
                                .foregroundColor(Color.white)
                                .cornerRadius(12)
                            }

                            ZStack {
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                                )
                                .mask(RoundedRectangle(cornerRadius: 12))
                                .frame(width: 176, height: 210)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                                VStack(alignment: .leading) {
                                    ZStack {
                                        Image(ImageResource.reduce)
                                            .padding(.bottom, 100)
                                            .cornerRadius(10)

                                        Text("Reduce Anxiety")
                                            .padding(.trailing, 5)
                                            .padding(.top, 100)
                                            .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 20))
                                            .foregroundColor(Color.black)
                                    }
                                }
                                .padding(.top, 38)
                                .frame(width: 176, height: 210)
                                .background(Color.accentBackgroundCard8)
                                .foregroundColor(Color.white)
                                .cornerRadius(12)
                            }
                        }
                        HStack {
                            ZStack {
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                                )
                                .mask(RoundedRectangle(cornerRadius: 12))
                                .frame(width: 176, height: 210)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                                VStack(alignment: .leading) {
                                    ZStack {
                                        Image(ImageResource.personalGrowth)
                                            .padding(.bottom, 110)
                                            .cornerRadius(10)
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Personal")
                                            Text("Growth")
                                        }
                                        .padding(.trailing, 60)
                                        .padding(.top, 80)
                                        .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 20))
                                        .foregroundColor(Color.white)
                                    }
                                }
                                .padding(.top, 38)
                                .frame(width: 176, height: 210)
                                .background(Color.accentBackgroundCard9)
                                .foregroundColor(Color.white)
                                .cornerRadius(12)
                            }

                            ZStack {
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                                )
                                .mask(RoundedRectangle(cornerRadius: 12))
                                .frame(width: 176, height: 167)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                                VStack(alignment: .leading) {
                                    ZStack {
                                        Image(ImageResource.betterSleep)
                                            .padding(.bottom, 100)
                                            .cornerRadius(10)

                                        Text("Better Sleep")
                                            .padding(.trailing, 40)
                                            .padding(.top, 70)
                                            .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 18))
                                            .foregroundColor(Color.white)
                                    }
                                }
                                .padding(.top, 38)
                                .frame(width: 176, height: 167)
                                .background(Color.accentBackgroundCard10)
                                .foregroundColor(Color.white)
                                .cornerRadius(12)
                            }
                        }
                    }
                }
            }
        }
        .toolbar(content: {
            TextToolbarContent()
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ChooseTopicView()
}
