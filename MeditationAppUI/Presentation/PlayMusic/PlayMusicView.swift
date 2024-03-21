//
//  PlayMusicView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 9/03/24.
//

import AVFoundation
import SwiftUI

struct PlayMusicView: View {
    @ObservedObject var viewModel: PlayerSliderViewModel

    @State private var currentPlayerTime: Double = 0.0
    @State private var isButtonPlayed: Bool = false

    init(musicMediaplayer: MusicMediaPlayer) {
        viewModel = .init(musicMediaPlayer: musicMediaplayer)

        let navBarAppearence = UINavigationBarAppearance()
        navBarAppearence.configureWithTransparentBackground()
        navBarAppearence.largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.white,
        ]
        navBarAppearence.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.white,
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearence
        UINavigationBar.appearance().standardAppearance = navBarAppearence
        UINavigationBar.appearance().tintColor = .white
    }

    var body: some View {
        ZStack {
            Color.accentBackground3
                .ignoresSafeArea()

            Image(ImageResource.playMusicBackground)

            VStack(alignment: .center, content: {
                Text("Focus Attention")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 30))
                    .foregroundStyle(.primaryLabel)
                    .padding(.bottom, 10)

                Text("7 days of calm")
                    .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 21))
                    .foregroundStyle(.secondaryLabel1)
                    .padding(.bottom, 60)

                DiscView()
                    .padding(.bottom, 30)

                Slider(value: $viewModel.progressValue) { didChange in
                    viewModel.didSliderChanged(didChange)
                }
                .tint(.tint)

                HStack(spacing: 40) {
                    Button(action: {}, label: {
                        ZStack {
                            Image(ImageResource.fastRewind)
                                .foregroundStyle(.tint2)
                            Text("15")
                                .foregroundStyle(.tint2)
                                .font(.system(size: 12))
                        }
                    })

                    Button(action: {
                        isButtonPlayed.toggle()
                        if isButtonPlayed {
                            viewModel.musicMediaPlayer.play()
                        } else {
                            viewModel.musicMediaPlayer.pause()
                        }
                    }, label: {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .accentColor(.tint)
                                .shadow(radius: 10)
                            if isButtonPlayed {
                                Image(systemName: "pause.fill")
                                    .foregroundColor(.white)
                                    .font(.system(.title))
                            } else {
                                Image(systemName: "play.fill")
                                    .foregroundColor(.white)
                                    .font(.system(.title))
                            }
                        }
                    })

                    Button(action: {}, label: {
                        ZStack(alignment: .center) {
                            Image(ImageResource.fastForward)
                                .foregroundStyle(.tint2)
                            Text("15")
                                .foregroundStyle(.tint2)
                                .font(.system(size: 12))
                        }
                    })
                }

            })
            .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
        }
        .toolbar(content: {
            TextToolbarContent(image: Image(ImageResource.backX))
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PlayMusicView(musicMediaplayer: MusicMediaPlayer())
}
