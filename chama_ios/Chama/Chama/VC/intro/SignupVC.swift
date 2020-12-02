//
//  SignupVC.swift
//  Chama
//
//  Created by Star on 12/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class SignupVC: BaseVC, CountryPickerDelegate {
    
    @IBOutlet weak var mJNameTF: UITextField!
    @IBOutlet weak var mJCodeTF: UITextField!
    @IBOutlet weak var mJPhoneTF: UITextField!
    @IBOutlet weak var mJPasswordTF: UITextField!
    @IBOutlet weak var mJChamaCodeTF: UITextField!
    
    @IBOutlet weak var mLNameTF: UITextField!
    @IBOutlet weak var mLCodeTF: UITextField!
    @IBOutlet weak var mLPhoneTF: UITextField!
    @IBOutlet weak var mLPasswordTF: UITextField!
    @IBOutlet weak var mLChamaNameTF: UITextField!
    
    var jCountryPicker: CountryPicker!
    var lCountryPicker: CountryPicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Register"
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setBackButton(vc: self, selector: #selector(onBack))
        showNavigationBar(ViewController: self)
    }
    
    private func setupView() {
        jCountryPicker = CountryPicker()
        jCountryPicker.setupWithCountries(APPS_COUNTRIES)
        //jCountryPicker.setup()
        jCountryPicker.countryPickerDelegate = self
        jCountryPicker.showPhoneNumbers = true
        jCountryPicker.setTryCurrentCountry()        
        mJCodeTF.inputView = jCountryPicker
        
        lCountryPicker = CountryPicker()
        lCountryPicker.setupWithCountries(APPS_COUNTRIES)
        //lCountryPicker.setup()
        lCountryPicker.countryPickerDelegate = self
        lCountryPicker.showPhoneNumbers = true
        lCountryPicker.setTryCurrentCountry()
        mLCodeTF.inputView = lCountryPicker
    }
    
    // Mark:
    // Mark: - CountryPickerDelegate
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountry: Country) {
        if picker == jCountryPicker {
            mJCodeTF.text = "+" + didSelectCountry.phoneCode!
        } else {
            mLCodeTF.text = "+" + didSelectCountry.phoneCode!
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onJSubmit(_ sender: Any) {        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideBarContainerVC") as! SideBarContainerVC
        vc.type = SideBarContainerVC.TYPE_LOGIN
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onLSubmit(_ sender: Any) {
        let vc = getVC("SetDefaultValuesVC") as! SetDefaultValuesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
