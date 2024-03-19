//
//  MeditationView.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 12/03/24.
//

import SwiftUI

struct MeditationView: View {
    @State var isActiveReminderes: Bool = false

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
                        Button(action: {}, label: {
                            Image(ImageResource.alls)
                                .padding()
                                .background(Color.accentBackground1)
                                .cornerRadius(10)
                        })

                        Button(action: {}, label: {
                            Image(ImageResource.heart)
                                .padding()
                                .background(Color.accentBackground1)
                                .cornerRadius(10)
                        })
                        Button(action: {}, label: {
                            Image(ImageResource.anioxus)
                                .padding()
                                .background(Color.accentBackground1)
                                .cornerRadius(10)
                        })
                        Button(action: {}, label: {
                            Image(ImageResource.sleep)
                                .padding()
                                .background(Color.accentBackground1)
                                .cornerRadius(10)
                        })
                        Button(action: {}, label: {
                            Image(ImageResource.kids)
                                .padding()
                                .background(Color.accentBackground1)
                                .cornerRadius(10)
                        })
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
        }
    }
}

#Preview {
    MeditationView()
}
