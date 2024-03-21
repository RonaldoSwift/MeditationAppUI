//
//  MeditationViewModel.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 21/03/24.
//

import FirebaseFirestore
import Foundation

final class MeditationViewModel {
    var firesStore = Firestore.firestore()

    @Published private(set) var meditationUiState = MeditationUiState.initial

    func getCategorias() {
        meditationUiState = MeditationUiState.loading

        let collectionCategoria = firesStore.collection("categoria_meditation")

        collectionCategoria.getDocuments { (querySnapshot: QuerySnapshot?, error: Error?) in

            if let errornoNull = error {
                self.meditationUiState = MeditationUiState.error("\(errornoNull)")

                print("\(errornoNull.localizedDescription)")
                return
            }

            if let querySnapshotNoNull = querySnapshot {
                var listaDeCategorias: [CategoryMeditation] = []

                for document in querySnapshotNoNull.documents {
                    let data = document.data()
                    let name = data["name"] as? String
                    let icon = data["icon"] as? String
                    listaDeCategorias.append(CategoryMeditation(name: name ?? "No trajo", icon: icon ?? "No trajo"))
                }
                self.meditationUiState = MeditationUiState.success(listaDeCategorias)
            }
        }
    }
}
