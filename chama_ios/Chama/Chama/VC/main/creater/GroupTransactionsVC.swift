//
//  GroupTransactionsVC.swift
//  Chama
//
//  Created by Star on 24/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class GroupTransactionsVC: SideMenuMainBaseVC {
    
    public static let TYPE_ALL = "all_transactions"
    public static let TYPE_CONTRIBUTED = "contributed_transactions"
    public static let TYPE_BORROWED = "borrowed_transactions"
    public static let TYPE_LOANED = "loaned_transactions"
    
    public var mType = GroupTransactionsVC.TYPE_ALL
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mTotalLB: UILabel!
    @IBOutlet weak var mTotalAmountLB: UILabel!
    
    var mDatas = Array<TransMD>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setBackButton(vc: self, selector: #selector(onBack))
        
        if mType == GroupTransactionsVC.TYPE_ALL {
            self.title = "Group Transactions"
            mTotalLB.text = "Total Balance"
        } else if mType == GroupTransactionsVC.TYPE_CONTRIBUTED {
            self.title = "Group Contributions"
            mTotalLB.text = "Total Contributed Amount"
        } else if mType == GroupTransactionsVC.TYPE_BORROWED {
            self.title = "Group Borrows"
            mTotalLB.text = "Total Borrowed Amount"
        } else if mType == GroupTransactionsVC.TYPE_LOANED {
            self.title = "Group Repaid Loans"
            mTotalLB.text = "Total Repaid Amount"
        }
        
        getData()
        self.mTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showNavigationBar(ViewController: self)
    }
    
    func getData() {
        var trans = TransMD()
        trans.amount = "500"
        trans.currency = "KES"
        trans.duedate = "05 September, 2018"
        trans.type = TransMD.TYPE_CONTRIBUTE
        trans.username = "Alex"
        mDatas.append(trans)
        
        trans = TransMD()
        trans.amount = "5200"
        trans.currency = "KES"
        trans.duedate = "05 September, 2018"
        trans.type = TransMD.TYPE_BORROW
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

extension GroupTransactionsVC: UITableViewDelegate, UITableViewDataSource {
    
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
