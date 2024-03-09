//
//  DiscView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 9/03/24.
//

import SwiftUI

struct DiscView: View {
    @State private var degree: Double = 0
    @State var timer = Timer.publish(every: 0.1, on: .current, in: .default).autoconnect()

    var color = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)

    var body: some View {
        ZStack(content: {
            // Disc
            ZStack {
                ForEach(1 ... 10, id: \.self) { discIndex in
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), location: 0),
                            .init(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), location: 0.5),
                            .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), location: 1),
                        ]), startPoint: UnitPoint(x: 0.2, y: 0), endPoint: UnitPoint(x: 0.7, y: 1)))
                        .frame(width: 130 + CGFloat(discIndex * 10), height: 130 + CGFloat(discIndex * 10))
                }
            }

            // Track Poster
            ZStack {
                Image(ImageResource.vinille)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())

                Circle()
                    .stroke(Color(color), lineWidth: 5)

            }.frame(width: 100, height: 100)
        })
        .rotationEffect(.degrees(degree))
        .onReceive(timer, perform: { _ in
            degree += 1
        })
    }
}

#Preview {
    DiscView()
}
