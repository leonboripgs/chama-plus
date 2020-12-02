//
//  BaseVC.swift
//  GoldenCoin
//
//  Created by Star on 6/28/17.
//  Copyright © 2017 Star. All rights reserved.
//

import UIKit

/*
func saveMe(_ user: UserModel) {
    saveValue(user.toJsonString(), key: "Me")
}

func getMe() -> UserModel {
    return UserModel(json: getValue("Me"))
}
*/

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavigationBar(ViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
        
    func getVC(_ storyboardID: String, storyboardName: String = "Main") -> BaseVC {        
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: storyboardID) as! BaseVC
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func onBack(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
}
