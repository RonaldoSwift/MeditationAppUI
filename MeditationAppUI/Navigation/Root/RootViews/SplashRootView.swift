//
//  SplashRootView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import DGCharts
import SwiftUI

struct SplashRootView: UIViewRepresentable {
    let entries: [BarChartDataEntry]

    func makeUIView(context _: Context) -> BarChartView {
        BarChartView()
    }

    func updateUIView(_ uiView: BarChartView, context _: Context) {
        let dataSet = BarChartDataSet(entries: entries)
        uiView.data = BarChartData(dataSet: dataSet)
    }
}

#if DEBUG
    struct SplashRootView_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                SplashRootView(entries: Transaction.dataEntriesForYear())
            }
        }
    }
#endif

struct Transaction {
    var year: Int
    var month: Double
    var quantity: Double

    static func dataEntriesForYear() -> [BarChartDataEntry] {
        allTransactions.map {
            BarChartDataEntry(x: $0.month, y: $0.quantity)
        }
    }

    private static var allTransactions: [Transaction] {
        [
            Transaction(year: 2019, month: 0, quantity: 86),
            Transaction(year: 2019, month: 1, quantity: 15),
            Transaction(year: 2019, month: 2, quantity: 50),
            Transaction(year: 2019, month: 3, quantity: 62),
            Transaction(year: 2019, month: 4, quantity: 20),
            Transaction(year: 2019, month: 5, quantity: 19),
            Transaction(year: 2019, month: 6, quantity: 71),
        ]
    }
}
