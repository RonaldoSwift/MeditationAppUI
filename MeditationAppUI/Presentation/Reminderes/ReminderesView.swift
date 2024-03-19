//
//  ReminderesView.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 18/03/24.
//

import SwiftUI

struct ReminderesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 5) {
                Text("What time would you ")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 25))

                Text("like to meditate?")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 25))
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Any time you can choose but We recommend")
                    .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 17))
                    .foregroundStyle(Color.colorLetras)

                Text("first thing in th morning.")
                    .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 17))
                    .foregroundStyle(Color.colorLetras)
            }

            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                )
                .mask(RoundedRectangle(cornerRadius: 12))
                .frame(width: 380, height: 212)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                VStack(alignment: .leading) {
                    Image(ImageResource.timeMeditation)
                }
                .padding(.top, 38)
                .frame(width: 380, height: 212)
                .background(Color.accentBackgroundCard5)
                .foregroundColor(Color.primaryLabel)
                .cornerRadius(12)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Which day would you ")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 25))

                Text("like to meditate?")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 25))
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Everyday is best, but we recommend picking ")
                    .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 17))
                    .foregroundStyle(Color.colorLetras)

                Text("at least five.")
                    .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 17))
                    .foregroundStyle(Color.colorLetras)
            }

            HStack(spacing: 10.5) {
                buttonDaysReminderes(completion: {}, textoButton: "Su")
                buttonDaysReminderes(completion: {}, textoButton: "M")
                buttonDaysReminderes(completion: {}, textoButton: "T")
                buttonDaysReminderes(completion: {}, textoButton: "W")
                buttonDaysReminderes(completion: {}, textoButton: "TH")
                buttonDaysReminderes(completion: {}, textoButton: "F")
                buttonDaysReminderes(completion: {}, textoButton: "S")
            }

            VStack {
                generalButtonComponent(onClickInSitioWeb: {}, textoDelButton: "SAVE")
                generalButtonComponent(onClickInSitioWeb: {}, textoDelButton: "NO THANKS")
            }
            .padding(.leading, 20)
        }
        .padding()
    }
}

#Preview {
    ReminderesView()
}
