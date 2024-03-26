//
//  HomeViewModel.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 24/03/24.
//

import FirebaseFirestore
import Foundation

final class HomeViewModel {
    var firestore = Firestore.firestore()

    @Published private(set) var homeUiState = HomeUiState.initial

    func getCategorias() {
        homeUiState = HomeUiState.loading

        let collectionCategoria = firestore.collection("home_meditation")

        collectionCategoria.getDocuments { (querySnapshot: QuerySnapshot?, error: Error?) in

            if let errorNoNull = error {
                self.homeUiState = HomeUiState.error(errorNoNull.localizedDescription)
                return
            }

            if let querySnapshotNoNull = querySnapshot {
                var listaDeHomeCategorias: [HomeMeditation] = []

                for document in querySnapshotNoNull.documents {
                    let data = document.data()
                    let icon = data["icon"] as? String
                    let name = data["name"] as? String
                    let textMeditation = data["textMeditation"] as? String
                    let time = data["time"] as? String

                    listaDeHomeCategorias.append(HomeMeditation(icon: icon ?? "No trajo", mame: name ?? "No trajo", textMeditation: textMeditation ?? "No trajo", time: time ?? "No trajo"))
                }
                self.homeUiState = HomeUiState.success(listaDeHomeCategorias)
            }
        }
    }
}
