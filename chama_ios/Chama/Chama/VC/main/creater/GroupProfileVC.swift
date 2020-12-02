//
//  GroupProfileVC.swift
//  Chama
//
//  Created by Star on 22/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class GroupProfileVC: SideMenuMainBaseVC {
    
    @IBOutlet weak var mTotalMembersLB: UILabel!
    @IBOutlet weak var mTotalBalanceLB: UILabel!
    @IBOutlet weak var mTotalContributeAmountLB: UILabel!
    @IBOutlet weak var mTotalBorrowedAmountLB: UILabel!
    @IBOutlet weak var mTotalLoanedAmountLB: UILabel!
    @IBOutlet weak var mTotalOutstandingAmountLB: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Group Profile"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onTotalMembers(_ sender: Any) {
        let vc = getVC("MembersVC") as! MembersVC
        vc.mType = MembersVC.MODE_MEMBERS
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onTotalBalance(_ sender: Any) {
        let vc = getVC("GroupTransactionsVC") as! GroupTransactionsVC
        vc.mType = GroupTransactionsVC.TYPE_ALL
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onTotalContribute(_ sender: Any) {
        let vc = getVC("GroupTransactionsVC") as! GroupTransactionsVC
        vc.mType = GroupTransactionsVC.TYPE_CONTRIBUTED
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onTotalBorrow(_ sender: Any) {
        let vc = getVC("GroupTransactionsVC") as! GroupTransactionsVC
        vc.mType = GroupTransactionsVC.TYPE_BORROWED
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onTotalLoan(_ sender: Any) {
        let vc = getVC("GroupTransactionsVC") as! GroupTransactionsVC
        vc.mType = GroupTransactionsVC.TYPE_LOANED
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onTotalOutstanding(_ sender: Any) {
        let vc = getVC("OutstandingVC") as! OutstandingVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onPendingLoanRequests(_ sender: Any) {
        let vc = getVC("PendingLoansVC") as! PendingLoansVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onNonContributedUsers(_ sender: Any) {
        let vc = getVC("MembersVC") as! MembersVC
        vc.mType = MembersVC.MODE_NON_CONTRIBUTED_USERS
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
