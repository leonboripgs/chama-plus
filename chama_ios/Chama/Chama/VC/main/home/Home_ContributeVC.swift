//
//  Home_ContributeVC.swift
//  Chama
//
//  Created by Star on 14/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit
import Charts

class Home_ContributeVC: SideMenuMainBaseVC {
    
    @IBOutlet weak var mAmountLB: UILabel!
    @IBOutlet weak var mCycleLB: UILabel!
    @IBOutlet weak var mPayMethodTF: UITextField!
    
    @IBOutlet weak var chartView: PieChartView!
    
    
    let mPayMethods = ["MPESA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareTabItem()
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        mPayMethodTF.inputView = pickerView
        mPayMethodTF.text = mPayMethods[0]
        
        // chart
        self.chartSetup(pieChartView: chartView)
        chartView.delegate = self
        
        // entry label styling
        chartView.entryLabelColor = .white
        chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
        
        self.setChartData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onSend(_ sender: Any) {
        toast(message: "Send")
    }
}

extension Home_ContributeVC {
    fileprivate func prepareTabItem() {
        tabItem.title = "CONTRIBUTE"
        //tabItem.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
}

extension Home_ContributeVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mPayMethods.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mPayMethods[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mPayMethodTF.text = mPayMethods[row]
    }
    
}

extension Home_ContributeVC: ChartViewDelegate {
    func chartSetup(pieChartView chartView: PieChartView) {
        chartView.usePercentValuesEnabled = true
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.58
        chartView.transparentCircleRadiusPercent = 0.61
        chartView.chartDescription?.enabled = false
        chartView.setExtraOffsets(left: 5, top: 5, right: 5, bottom: 5)
        
        chartView.drawCenterTextEnabled = false
        
        chartView.drawHoleEnabled = false
        chartView.rotationAngle = 0
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = true
        
        let l = chartView.legend
        l.horizontalAlignment = .center
        l.orientation = .horizontal
        l.drawInside = false
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
    }
    
    func setChartData() {
        var entries = Array<PieChartDataEntry>()
        entries.append(PieChartDataEntry(value: 10.0, label: "Emergency fund"))
        entries.append(PieChartDataEntry(value: 70.0, label: "Savings"))
        entries.append(PieChartDataEntry(value: 20.0, label: "Loans"))
        
        let set = PieChartDataSet(values: entries, label: "")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
        
        set.colors = [LIGHT_ORANGE_COLOR, LIGHT_GREEN_COLOR, LIGHT_YELLOW_COLOR]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.white)
        
        chartView.data = data
        chartView.highlightValues(nil)
    }
}
