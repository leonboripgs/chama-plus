//
//  Home_BorrowVC.swift
//  Chama
//
//  Created by Star on 14/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class Home_BorrowVC: SideMenuMainBaseVC {

    @IBOutlet weak var mPayMethodTF: UITextField!
    
    let mPayMethods = ["MPESA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareTabItem()
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        mPayMethodTF.inputView = pickerView
        mPayMethodTF.text = mPayMethods[0]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onEmergencyFund(_ sender: Any) {
        let vc = getVC("EmergencyFundVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func on3xMySavings(_ sender: Any) {
        let vc = getVC("Save3xVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onMerryGoRound(_ sender: Any) {
        let vc = getVC("MerryVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onWithDraw(_ sender: Any) {
        toast(message: "Withdraw")
    }
}

extension Home_BorrowVC {
    fileprivate func prepareTabItem() {
        tabItem.title = "BORROW"
        //tabItem.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
}

extension Home_BorrowVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mPayMethods.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mPayMethods[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mPayMethodTF.text = mPayMethods[row]
    }
    
}
