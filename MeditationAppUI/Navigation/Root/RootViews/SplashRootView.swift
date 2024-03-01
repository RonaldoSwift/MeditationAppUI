//
//  SplashRootView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import SwiftUI

struct SplashRootView: View {
    var body: some View {
        WelcomeView()
    }
}

#if DEBUG
struct SplashRootView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            SplashRootView()
        }
    }
}
#endif
