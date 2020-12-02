//
//  SetDefaultValuesVC.swift
//  Chama
//
//  Created by Star on 13/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class SetDefaultValuesVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Register"
        setBackButton(vc: self, selector: #selector(onBack))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showNavigationBar(ViewController: self)
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
