//
//  Home_LoanVC.swift
//  Chama
//
//  Created by Star on 14/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit
import Charts

class Home_LoanVC: SideMenuMainBaseVC {

    @IBOutlet weak var mRepayContainerView: UIView!
    @IBOutlet weak var chartView: PieChartView!
    
    //@IBOutlet weak var mTableView: UITableView!
    
    //var mDatas = Array<LoanMD>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareTabItem()
        
        // chart
        self.chartSetup(pieChartView: chartView)
        chartView.delegate = self
        
        // entry label styling
        chartView.entryLabelColor = .white
        chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
        
        self.setChartData()
        
        //getData()
        //self.mTableView.reloadData()
    }
    
    /*
    func getData() {
        var trans = LoanMD()
        trans.amount = "200"
        trans.currency = "KES"
        trans.duedate = "05 Auguest, 2019"
        trans.type = LoanMD.TYPE_EMERGENCY
        trans.username = "Paul"
        mDatas.append(trans)
        
        trans = LoanMD()
        trans.amount = "200"
        trans.currency = "KES"
        trans.duedate = "05 September, 2019"
        trans.type = LoanMD.TYPE_3X
        trans.username = "Alex"
        mDatas.append(trans)
    }
 */
    
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

extension Home_LoanVC {
    fileprivate func prepareTabItem() {
        tabItem.title = "LOANS"
        //tabItem.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
}

extension Home_LoanVC: ChartViewDelegate {
    func chartSetup(pieChartView chartView: PieChartView) {
        chartView.usePercentValuesEnabled = true
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.58
        chartView.transparentCircleRadiusPercent = 0.61
        chartView.chartDescription?.enabled = false
        chartView.setExtraOffsets(left: 0, top: 0, right: 0, bottom: 0)
        
        chartView.drawCenterTextEnabled = false
        
        chartView.drawHoleEnabled = false
        chartView.rotationAngle = -90
        chartView.rotationEnabled = false
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
        entries.append(PieChartDataEntry(value: 30.0, label: "Paid"))
        entries.append(PieChartDataEntry(value: 70.0, label: "Out Standing"))
        
        let set = PieChartDataSet(values: entries, label: "")
        set.drawIconsEnabled = false
        set.sliceSpace = 2        
        
        set.colors = [LIGHT_ORANGE_COLOR, LIGHT_GREEN_COLOR]
        
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

/*
extension Home_LoanVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
        //return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mDatas.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let d = mDatas[indexPath.row]
        let cell = UIView.loadFromNibNamed(nibNamed: "TransCell") as! TransCell
        cell.setData(d, viewID: String(indexPath.row))
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let d = mDatas[indexPath.row]
        
        var message = ""
        if d.type == LoanMD.TYPE_EMERGENCY {
            message = d.username + " is requesting "
            message = message + d.currency + ". " + d.amount
            message = message + " emergency fund payable by " + d.duedate
        } else if d.type == LoanMD.TYPE_3X {
            message = d.username + " is requesting "
            message = message + d.currency + ". " + d.amount
            message = message + " 3x my saving payable by " + d.duedate
        }
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        
        let okaction = UIAlertAction(title: "APPROVE", style: .default) { (action: UIAlertAction) in
            print("You've pressed default");
            toast(message: "Approved")
        }
        
        let cancelaction = UIAlertAction(title: "DECLINE", style: .cancel) { (action: UIAlertAction) in
            print("You've pressed cancel");
            toast(message: "Declined")
        }
        
        alertController.addAction(okaction)
        alertController.addAction(cancelaction)
        self.present(alertController, animated: true, completion: nil)
    }
}
*/
