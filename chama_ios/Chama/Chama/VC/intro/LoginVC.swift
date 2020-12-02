//
//  LoginVC.swift
//  Chama
//
//  Created by Star on 12/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class LoginVC: BaseVC, CountryPickerDelegate {
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var checkBox: CTCheckbox!
    
    var countryPicker: CountryPicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavigationBar(ViewController: self)
    }
    
    private func setupView() {
        checkBox.setColor(GRAY_COLOR, for: .normal)
        checkBox.textLabel.text = "Remember Me?"
        checkBox.textLabel.textColor = GRAY_COLOR
        
        countryPicker = CountryPicker()
        countryPicker.setupWithCountries(APPS_COUNTRIES)
        
        //countryPicker.setup()
        countryPicker.countryPickerDelegate = self
        countryPicker.showPhoneNumbers = true
        
        countryPicker.setTryCurrentCountry()
        
        codeTF.inputView = countryPicker
    }
    
    // Mark:
    // Mark: - CountryPickerDelegate
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountry: Country) {
        codeTF.text = "+" + didSelectCountry.phoneCode!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onHelp(_ sender: Any) {
        toast(message: "Help")
    }
    
    @IBAction func onLogin(_ sender: Any) {        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideBarContainerVC") as! SideBarContainerVC
        vc.type = SideBarContainerVC.TYPE_LOGIN
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onSignup(_ sender: Any) {
        let vc = getVC("SignupVC") as! SignupVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
