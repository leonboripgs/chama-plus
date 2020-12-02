//
//  OutstandingVC.swift
//  Chama
//
//  Created by Star on 21/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class OutstandingVC: SideMenuMainBaseVC {

    @IBOutlet weak var mTableView: UITableView!
    var mDatas = Array<OutstandingMD>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Outstanding"
        
        setBackButton(vc: self, selector: #selector(onBack))
        
        getData()
        self.mTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showNavigationBar(ViewController: self)
    }
    
    func getData() {
        var trans = OutstandingMD()
        trans.username = "Kebin"
        trans.borrowed_amount = "200"
        trans.loan_amount = "220"
        trans.currency = "KES"
        trans.borrow_date = "2019.02.18"
        trans.schedule_loan_date = "2019.03.18"
        mDatas.append(trans)
        
        trans = OutstandingMD()
        trans.username = "Kebin"
        trans.borrowed_amount = "200"
        trans.loan_amount = "220"
        trans.currency = "KES"
        trans.borrow_date = "2019.02.18"
        trans.schedule_loan_date = "2019.03.18"
        mDatas.append(trans)
        
        trans = OutstandingMD()
        trans.username = "Kebin"
        trans.borrowed_amount = "200"
        trans.loan_amount = "220"
        trans.currency = "KES"
        trans.borrow_date = "2019.02.18"
        trans.schedule_loan_date = "2019.03.18"
        mDatas.append(trans)
        
        trans = OutstandingMD()
        trans.username = "Kebin"
        trans.borrowed_amount = "200"
        trans.loan_amount = "220"
        trans.currency = "KES"
        trans.borrow_date = "2019.02.18"
        trans.schedule_loan_date = "2019.03.18"
        mDatas.append(trans)
        
        trans = OutstandingMD()
        trans.username = "Kebin"
        trans.borrowed_amount = "200"
        trans.loan_amount = "220"
        trans.currency = "KES"
        trans.borrow_date = "2019.01.18"
        trans.schedule_loan_date = "2019.02.18"
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

extension OutstandingVC: UITableViewDelegate, UITableViewDataSource {
    
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
        let cell = UIView.loadFromNibNamed(nibNamed: "OutstandingCell") as! OutstandingCell
        cell.setData(d, viewID: String(indexPath.row))
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let d = mDatas[indexPath.row]
        
        let vc = getVC("OutstandingDetailVC") as! OutstandingDetailVC
        vc.mData = d
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
