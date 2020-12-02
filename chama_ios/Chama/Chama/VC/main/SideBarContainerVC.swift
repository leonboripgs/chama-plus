//
//  SideBarContainerVC.swift
//  Chama
//
//  Created by Star on 13/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit
import SidebarOverlay

class SideBarContainerVC: SOContainerViewController {
    
    public static let TYPE_LOGIN = "login"
    public static let TYPE_SIGNUP = "signup"
    public var type = TYPE_LOGIN

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.menuSide = .left
        
        if type == SideBarContainerVC.TYPE_LOGIN {
            self.topViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideBarNavigationLoginVC") as! UINavigationController
            
            let homeContributeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home_ContributeVC") as! Home_ContributeVC
            let homeBorrowVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home_BorrowVC") as! Home_BorrowVC
            let homeLoanVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home_LoanVC") as! Home_LoanVC
            let homeTabVC = HomeTabVC(viewControllers: [homeContributeVC, homeBorrowVC, homeLoanVC])
            
            self.topViewController?.addChild(homeTabVC)
 
        } else {
            self.topViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideBarNavigationSignupVC")
        }
        
        self.sideViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LeftViewController")
    }
    
    override var isSideViewControllerPresented: Bool {
        didSet {
            let action = isSideViewControllerPresented ? "opened" : "closed"
            let side = self.menuSide == .left ? "left" : "right"
            NSLog("You've \(action) the \(side) view controller.")
        }
    }
    
    /*
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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

}
