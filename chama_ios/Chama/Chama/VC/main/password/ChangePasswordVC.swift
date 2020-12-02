//
//  ChangePasswordVC.swift
//  Chama
//
//  Created by Star on 14/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class ChangePasswordVC: SideMenuMainBaseVC {
    
    @IBOutlet weak var mCurrentPasswordTF: UITextField!
    @IBOutlet weak var mNewPasswordTF: UITextField!
    @IBOutlet weak var mConfirmPasswordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Change Password"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onUpdate(_ sender: Any) {
        toast(message: "Update")
    }
}
