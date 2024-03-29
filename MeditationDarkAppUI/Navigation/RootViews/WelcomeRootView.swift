//
//  WelcomeRootView.swift
//  MeditationDarkAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 29/02/24.
//

import Foundation
import SwiftUI

struct WelcomeRootView: View {
    var body: some View {
        DarkWelcomeView()
    }
}

#if DEBUG
    struct WelcomeRootView_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                WelcomeRootView()
            }
        }
    }
#endif
