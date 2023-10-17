//
//  TransactionBarChartView.swift
//  Finance_Hope
//
//  Created by Izbassar on 14.10.2023.
//

import DGCharts
import SwiftUI

struct TransactionBarChartView: UIViewRepresentable {
    
    let entries: [BarChartDataEntry]
    let barChart = BarChartView()
    @Binding var selectedYear: Int
    @Binding var selectedItem: String
    
    func makeUIView(context: Context) -> DGCharts.BarChartView {
        barChart.delegate = context.coordinator
        return barChart
    }
    
    func updateUIView(_ uiView: DGCharts.BarChartView, context: Context) {
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.label = "Transactions"
        uiView.noDataText = "No Data"
        uiView.data = BarChartData(dataSet: dataSet)
        uiView.rightAxis.enabled = false
        uiView.setScaleEnabled(false)
        if uiView.scaleX == 1.0 {
            uiView.zoom(scaleX: 1.5, scaleY: 1, x: 0, y: 0)
        }
        formatDataSet(dataSet: dataSet)
        formatLeftAxis(leftAxis: uiView.leftAxis)
        formatXAxis(xAxis: uiView.xAxis)
        formatLegend(legend: uiView.legend)
        uiView.notifyDataSetChanged()
    }
    
    class Coordinator: NSObject, ChartViewDelegate {
        let parent: TransactionBarChartView
        
        init(parent: TransactionBarChartView) {
            self.parent = parent
        }
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            let month = Transaction.months[Int(entry.x)]
            let quantity = Int(entry.y)
            parent.selectedItem = "\(quantity) sold in \(month)"
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func formatDataSet(dataSet: BarChartDataSet) {
        dataSet.colors = [.red, .blue]
        dataSet.valueColors = [.blue, .red]
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        dataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
    }
    
    func formatLeftAxis(leftAxis: YAxis) {
        leftAxis.labelTextColor = .red
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: formatter)
        leftAxis.axisMinimum = 0
    }
    
    func formatXAxis(xAxis: XAxis) {
        xAxis.valueFormatter = IndexAxisValueFormatter(values: Transaction.months)
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = .red
    }
    
    func formatLegend(legend: Legend) {
        legend.textColor = .red
        legend.horizontalAlignment = .right
        legend.verticalAlignment = .top
        legend.drawInside = true
        legend.yOffset = 30.0
    }
}

struct TransactionBarChartView_Preview: PreviewProvider {
    static var previews: some View {
        TransactionBarChartView(entries: Transaction.dataEntriesForYear(2019, transactions: Transaction.allTransactions), selectedYear: .constant(2019), selectedItem: .constant(""))
    }
}
