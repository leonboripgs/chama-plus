//
//  LeftViewController.swift
//  Chama
//
//  Created by Star on 13/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class LeftViewController: BaseVC {

    @IBOutlet weak var mPhotoIV: UIImageView!
    @IBOutlet weak var mNameLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onEditProfile(_ sender: Any) {
        self.so_containerViewController?.isSideViewControllerPresented = false
        let navVC = self.so_containerViewController?.topViewController as? UINavigationController
        if (!(navVC?.visibleViewController?.isKind(of: ProfileVC.self))!) {
            let vc = getVC("ProfileVC")
            navVC?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func onHome(_ sender: Any) {
        self.so_containerViewController?.isSideViewControllerPresented = false
        let navVC = self.so_containerViewController?.topViewController as? UINavigationController
        if (!(navVC?.visibleViewController?.isKind(of: HomeTabVC.self))!) {
            let homeContributeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home_ContributeVC") as! Home_ContributeVC
            let homeBorrowVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home_BorrowVC") as! Home_BorrowVC
            let homeLoanVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home_LoanVC") as! Home_LoanVC
            let homeTabVC = HomeTabVC(viewControllers: [homeContributeVC, homeBorrowVC, homeLoanVC])
            
            navVC?.pushViewController(homeTabVC, animated: true)
        }
    }
    
    @IBAction func onTransactions(_ sender: Any) {
        self.so_containerViewController?.isSideViewControllerPresented = false
        let navVC = self.so_containerViewController?.topViewController as? UINavigationController
        if (!(navVC?.visibleViewController?.isKind(of: TransactionTabVC.self))!) {
            let transAllVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Transaction_AllVC") as! Transaction_AllVC
            let transContributeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Transaction_ContributeVC") as! Transaction_ContributeVC
            let transBorrowVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Transaction_BorrowVC") as! Transaction_BorrowVC
            let transLoanVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Transaction_LoanVC") as! Transaction_LoanVC
            let transTabVC = TransactionTabVC(viewControllers: [transAllVC, transContributeVC, transBorrowVC, transLoanVC])
            
            navVC?.pushViewController(transTabVC, animated: true)
        }
    }
    
    @IBAction func onProfile(_ sender: Any) {
        self.so_containerViewController?.isSideViewControllerPresented = false
        let navVC = self.so_containerViewController?.topViewController as? UINavigationController
        if (!(navVC?.visibleViewController?.isKind(of: ProfileVC.self))!) {
            let vc = getVC("ProfileVC")
            navVC?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func onChangePassword(_ sender: Any) {
        self.so_containerViewController?.isSideViewControllerPresented = false
        let navVC = self.so_containerViewController?.topViewController as? UINavigationController
        if (!(navVC?.visibleViewController?.isKind(of: ChangePasswordVC.self))!) {
            let vc = getVC("ChangePasswordVC")
            navVC?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func onContactUs(_ sender: Any) {
        self.so_containerViewController?.isSideViewControllerPresented = false
        let navVC = self.so_containerViewController?.topViewController as? UINavigationController
        if (!(navVC?.visibleViewController?.isKind(of: ContactVC.self))!) {
            let vc = getVC("ContactVC")
            navVC?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func onGroupProfile(_ sender: Any) {
        self.so_containerViewController?.isSideViewControllerPresented = false
        let navVC = self.so_containerViewController?.topViewController as? UINavigationController
        if (!(navVC?.visibleViewController?.isKind(of: GroupProfileVC.self))!) {
            let vc = getVC("GroupProfileVC")
            navVC?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func onLogout(_ sender: Any) {
        self.so_containerViewController?.isSideViewControllerPresented = false;
        self.navigationController?.popToRootViewController(animated: false)
    }
    
}
