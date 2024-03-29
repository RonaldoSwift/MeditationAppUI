//
//  PrincipalView.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 1/03/24.
//

import SwiftUI

struct PrincipalView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            HomeView()
                .tabItem {
                    Image(ImageResource.lunaIcon)
                    Text("Sleep")
                }
            MeditationView()
                .tabItem {
                    Image(ImageResource.meditateIcon)
                    Text("Meditate")
                }
            HappyMorningView()
                .tabItem {
                    Image(ImageResource.musicIcon)
                    Text("Music")
                }
            ProfileView()
                .tabItem {
                    Image(ImageResource.personIcon)
                    Text("Afsar")
                }
        }
    }
}

#Preview {
    PrincipalView()
}
