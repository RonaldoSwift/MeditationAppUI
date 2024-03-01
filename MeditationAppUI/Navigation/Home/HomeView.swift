//
//  HomeView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("HOME")
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
