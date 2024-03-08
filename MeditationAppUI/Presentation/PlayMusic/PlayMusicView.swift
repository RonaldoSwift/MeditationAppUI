//
//  PlayMusicView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 7/03/24.
//

// You can also review this link https://stackoverflow.com/questions/58779184/how-to-control-avplayer-in-swiftui

import AVFoundation
import SwiftUI

struct Song {
    let songLength: Int
}

struct PlayMusicView: View {
    @ObservedObject var viewModel: PlayerSliderViewModel

    @State private var currentPlayerTime: Double = 0.0

    @State private var degree: Double = 0
    @State var timer = Timer.publish(every: 0.1, on: .current, in: .default).autoconnect()

    init(musicMediaplayer: MusicMediaPlayer) {
        viewModel = .init(musicMediaPlayer: musicMediaplayer)
    }

    var body: some View {
        ZStack {
            Color.accentBackground2
                .ignoresSafeArea()

            Image(ImageResource.playMusicBackground)

            VStack(alignment: .center, content: {
                Text("Focus Attention")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 30))
                    .foregroundStyle(.primaryLabel)

                Text("7 days of calm")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 21))
                    .foregroundStyle(.secondaryLabel1)

                ZStack(content: {
                    // Disc
                    ZStack {
                        ForEach(1 ... 10, id: \.self) { discIndex in
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), location: 0),
                                    .init(color: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)), location: 0.5),
                                    .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), location: 1),
                                ]), startPoint: UnitPoint(x: 0.2, y: 0), endPoint: UnitPoint(x: 0.7, y: 1)))
                                .frame(width: 130 + CGFloat(discIndex * 10), height: 130 + CGFloat(discIndex * 10))
                        }
                    }

                    // Track Poster
                    ZStack {
                        Image(ImageResource.logo)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())

                        Circle()
                            .stroke(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)), lineWidth: 5)

                    }.frame(width: 100, height: 100)
                })
                .rotationEffect(.degrees(degree))
                .onReceive(timer, perform: { _ in
                    degree += 1
                })

                Slider(value: $viewModel.progressValue) { didChange in
                    viewModel.didSliderChanged(didChange)
                }

                HStack(spacing: 40) {
                    Button(action: {
                        print("Rewind")
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .accentColor(.pink)
                                .shadow(radius: 10)
                            Image(systemName: "backward.fill")
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }

                    Button(action: {
                        viewModel.musicMediaPlayer.play()
                        print("Pause")
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .accentColor(.pink)
                                .shadow(radius: 10)
                            Image(systemName: "pause.fill")
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }

                    Button(action: {
                        print("Skip")
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .accentColor(.pink)
                                .shadow(radius: 10)
                            Image(systemName: "forward.fill")
                                .foregroundColor(.white)
                                .font(.system(.title))
                        }
                    }
                }

            })
        }
    }
}

// #Preview {
//    PlayMusicView(song: Song(songLength: 5))
// }
