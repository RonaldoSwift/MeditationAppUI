//
//  PrincipalRootView.swift
//  MeditationDarkAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 29/02/24.
//

import Foundation
import SwiftUI

struct PrincipalRootView: View {
    var body: some View {
        DarkWelcomeView()
    }
}

#if DEBUG
struct PrincipalRootView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            PrincipalRootView()
        }
    }
}
#endif
