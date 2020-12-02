//
//  SideMenuMainBaseVC.swift
//  GoldenCoin
//
//  Created by Star on 6/29/17.
//  Copyright © 2017 Star. All rights reserved.
//

import UIKit

class SideMenuMainBaseVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showNavigationBar(ViewController: self)
    }
    
    func hideRightBtn() {
        self.navigationItem.setRightBarButtonItems(nil, animated: true)
    }
    
    func setNavigationBar() {
        //setBackButton(vc: self, selector: #selector(onBack))
        //setLeftButton(vc: self, selector: #selector(showMeMyMenu), imgName: "ic_toggle.png", btnWidth: 23.0, btnHeight: 18.0)
        setLeftToggleBtn(vc: self, selector: #selector(showMeMyMenu))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func showMeMyMenu () {
        if let container = self.so_containerViewController {
            container.isSideViewControllerPresented = true
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
