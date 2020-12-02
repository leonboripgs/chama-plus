//
//  Transaction_LoanVC.swift
//  Chama
//
//  Created by Star on 14/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class Transaction_LoanVC: SideMenuMainBaseVC {

    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mTotalAmountLB: UILabel!
    
    var mDatas = Array<TransMD>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareTabItem()
        getData()
        self.mTableView.reloadData()
    }
    
    func getData() {
        var trans = TransMD()
        trans.amount = "500"
        trans.currency = "KES"
        trans.duedate = "05 September, 2018"
        trans.type = TransMD.TYPE_LOANS
        trans.username = "Alex"
        mDatas.append(trans)
        
        trans = TransMD()
        trans.amount = "5200"
        trans.currency = "KES"
        trans.duedate = "05 September, 2018"
        trans.type = TransMD.TYPE_BACK
        trans.username = "Alex"
        mDatas.append(trans)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Transaction_LoanVC {
    fileprivate func prepareTabItem() {
        tabItem.title = "LOANS"
        //tabItem.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
}

extension Transaction_LoanVC: UITableViewDelegate, UITableViewDataSource {
    
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
        //let d = mDatas[indexPath.row]
    }
}
