//
//  PrincipalRootView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import SwiftUI

struct PrincipalRootView: View {
    var body: some View {
        ViewA()
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
