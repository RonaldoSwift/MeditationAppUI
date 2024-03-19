//
//  HappyMorningView.swift
//  MeditationAppUI
// #imageLiteral(resourceName: "HappyMorningImage.svg")
//  Created by Ronaldo Andre on 13/03/24.
//

import SwiftUI

struct HappyMorningView: View {
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Image(ImageResource.happyMorning)
                    .ignoresSafeArea()

                HStack(spacing: 150) {}
                    .padding(.bottom, 100)
            }

            Spacer()

            VStack(alignment: .leading, spacing: 10) {
                Text("Happy Morning")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 30))

                Text("COURSE")
                    .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 16))
                    .foregroundStyle(Color.colorLetras)

                VStack(alignment: .leading) {
                    Text("Ease the mind a restful night sleep with")
                    Text("these deep, amblent tones.")
                }
                .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 17))
                .foregroundStyle(Color.colorLetras)
                .padding(.bottom, 10)

                HStack(spacing: 30) {
                    HStack {
                        Image(ImageResource.heartEncendido)
                        Text("24.234")
                        Text("Favorits")
                    }
                    .foregroundStyle(Color.colorLetras)

                    HStack {
                        Image(ImageResource.auricular)
                        Text("34.234")
                        Text("Lestening")
                    }
                    .foregroundStyle(Color.colorLetras)
                }

                Text("Pick a Nnrrador")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 20))
                    .padding(.top, 25)

                HStack(spacing: 70) {
                    Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                        Text("MALE VOICE")
                            .foregroundStyle(Color.colorButton)
                    })

                    Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                        Text("FEMALE VOICE")
                            .foregroundStyle(Color.colorLetras)
                    })
                }
                .padding(.top, 10)
                .padding(.bottom, 20)

                HStack {
                    Image(ImageResource.playPurple)
                    VStack(alignment: .leading) {
                        Text("Focus Attention")
                        Text("10 MIN")
                    }
                }
                .padding(.bottom, 20)

                HStack {
                    Image(ImageResource.playNormal)
                    VStack(alignment: .leading) {
                        Text("Body Scan")
                        Text("5 MIN")
                    }
                }
                .padding(.bottom, 20)

                HStack {
                    Image(ImageResource.playNormal)
                    VStack(alignment: .leading) {
                        Text("Making Happiness")
                        Text("3 MIN")
                    }
                }
                .padding(.bottom, 20)

                Spacer()
            }
            .padding()
            .padding(.bottom, 80)
        }
        .toolbar(content: {
            TextToolbarContent()
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HappyMorningView()
}
