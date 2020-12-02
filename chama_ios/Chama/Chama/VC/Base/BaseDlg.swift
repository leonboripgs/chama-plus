//
//  BaseDlg.swift
//  Kinect
//
//  Created by Star on 30/10/2018.
//  Copyright © 2018 Star. All rights reserved.
//

import UIKit
import PopupDialog

class BaseDlg: BaseVC {
    
    public var popupDialog: PopupDialog!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showLoadingOnDlg() {
        showLoading(self.view)
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
