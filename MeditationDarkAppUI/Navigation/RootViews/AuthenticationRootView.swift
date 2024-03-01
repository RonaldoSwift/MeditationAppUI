//
//  AuthenticationRootView.swift
//  MeditationDarkAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 29/02/24.
//

import Foundation
import SwiftUI

struct AuthenticationRootView: View {
    var body: some View {
        DarkWelcomeView()
    }
}

#if DEBUG
struct AuthenticationRootView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            AuthenticationRootView()
        }
    }
}
#endif
