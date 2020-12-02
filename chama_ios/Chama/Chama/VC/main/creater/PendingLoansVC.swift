//
//  PendingLoansVC.swift
//  Chama
//
//  Created by Star on 24/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class PendingLoansVC: SideMenuMainBaseVC {
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mTotalAmountLB: UILabel!
    
    var mDatas = Array<LoanMD>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setBackButton(vc: self, selector: #selector(onBack))
        self.title = "Pending Loan Requests"
        
        getData()
        self.mTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showNavigationBar(ViewController: self)
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PendingLoansVC: UITableViewDelegate, UITableViewDataSource {
    
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
