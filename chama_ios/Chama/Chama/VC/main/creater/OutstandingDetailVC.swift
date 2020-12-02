//
//  OutstandingDetailVC.swift
//  Chama
//
//  Created by Star on 21/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class OutstandingDetailVC: SideMenuMainBaseVC {
    
    @IBOutlet weak var mPhotoIV: UIImageView!
    @IBOutlet weak var mNameLB: UILabel!
    @IBOutlet weak var mRoleLB: UILabel!
    
    @IBOutlet weak var mAmountLB: UILabel!
    @IBOutlet weak var mLeftDateLB: UILabel!
    @IBOutlet weak var mBorrowedAmountLB: UILabel!
    @IBOutlet weak var mLoanAmountLB: UILabel!
    @IBOutlet weak var mBorrowedDateLB: UILabel!
    @IBOutlet weak var mScheduledLoanLB: UILabel!
    
    public var mData = OutstandingMD()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Detail"
        setBackButton(vc: self, selector: #selector(onBack))
        
        initLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showNavigationBar(ViewController: self)
    }
    
    func initLayout() {
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onRemind(_ sender: Any) {
    }

    @IBAction func onSuspend(_ sender: Any) {
    }
}


