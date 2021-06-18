//
//  ViewController.swift
//  Chats-Tutorial
//
//  Created by Omar Abdalla on 6/17/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
    @IBOutlet weak var lineChartBox: LineChartView!
    
    @IBOutlet weak var pieChartBox: PieChartView!
    
    @IBOutlet weak var barChartBox: BarChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data = [0,13,41,5,19,32,6,56,23]
        graphLineChart(dataArray: data)
        graphPieChart(dataArray: data)
        graphBarChart(dataArray: data)
    }
    func graphLineChart(dataArray: [Int]) {
        // Make lineChartBox size have width anf height both equal to width of screen
        lineChartBox.frame = CGRect (x:0, y: 0, width: self.view.frame.wi
                                     dth, height: self.view.frame.size.width / 2)
        
        // Make lineChartBox center to be horizontally centered, offset towards the yop of the screen
        lineChartBox.center.x = self.view.center.x
        lineChartBox.center.y = self.view.center.y - 240
        
        //Settings when chart has no data
        lineChartBox.noDataText = "No data available"
        lineChartBox.noDataTextColor = UIColor.black
        
        // Intialize Array that will evetually be displayed on the graph
        var entries = [ChartDataEntry]()
        
        // For every element in given dataset, setj the X and Y coordinates in a data chart entry and add to the entries list
        for i in 0..<dataArray.count{
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        let dataSet = LineChartDataSet(entries: entries, label: "Line Chart")
        dataSet.colors = ChartColorTemplates.joyful()
        
        //Make object that will be added tot he chart and set it to the variable in the Storyboard
        let data = LineChartData(dataSet: dataSet)
        lineChartBox.data = data
        lineChartBox.chartDescription?.text = "Pi values"
        
        //Animation
        lineChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
        
        }
    func graphPieChart(dataArray: [Int]) {
        // Make lineChartBox size have width anf height both equal to width of screen
        pieChartBox.frame = CGRect (x:0, y: 0, width: self.view.frame.width, height: self.view.frame.size.width / 2)
        
        // Make lineChartBox center to be horizontally centered, offset towards the yop of the screen
        pieChartBox.center.x = self.view.center.x
        pieChartBox.center.y = self.view.center.y
        
        //Settings when chart has no data
        pieChartBox.noDataText = "No data available"
        pieChartBox.noDataTextColor = UIColor.black
        
        // Intialize Array that will evetually be displayed on the graph
        var entries = [ChartDataEntry]()
        
        // For every element in given dataset, setj the X and Y coordinates in a data chart entry and add to the entries list
        for i in 0..<dataArray.count{
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        let dataSet = PieChartDataSet(entries: entries, label: "Pie Chart")
        dataSet.colors = ChartColorTemplates.joyful()
        
        //Make object that will be added tot he chart and set it to the variable in the Storyboard
        let data = PieChartData(dataSet: dataSet)
        pieChartBox.data = data
        pieChartBox.chartDescription?.text = "Pi values"
        
        //Animation
        pieChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
    }
    func graphBarChart(dataArray: [Int]) {
        // Make lineChartBox size have width anf height both equal to width of screen
        barChartBox.frame = CGRect (x:0, y: 0, width: self.view.frame.width, height: self.view.frame.size.width / 2)
        
        // Make lineChartBox center to be horizontally centered, offset towards the yop of the screen
        barChartBox.center.x = self.view.center.x
        barChartBox.center.y = self.view.center.y + 240
        
        //Settings when chart has no data
        barChartBox.noDataText = "No data available"
        barChartBox.noDataTextColor = UIColor.black
        
        // Intialize Array that will evetually be displayed on the graph
        var entries = [BarChartDataEntry]()
        
        // For every element in given dataset, setj the X and Y coordinates in a data chart entry and add to the entries list
        for i in 0..<dataArray.count{
            let value = BarChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        let dataSet = BarChartDataSet(entries: entries, label: "Bar Chart")
        dataSet.colors = ChartColorTemplates.joyful()
        
        //Make object that will be added tot he chart and set it to the variable in the Storyboard
        let data = BarChartData(dataSet: dataSet)
        barChartBox.data = data
        barChartBox.chartDescription?.text = "Pi values"
        
        //Animation
        barChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
    }
}

