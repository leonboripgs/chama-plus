//
//  Save3xVC.swift
//  Chama
//
//  Created by Star on 15/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class Save3xVC: BaseVC, CountryPickerDelegate {
    
    @IBOutlet weak var mAmountTF: UITextField!
    @IBOutlet weak var mCurrencyTF: UITextField!
    @IBOutlet weak var mConfirmAmountTF: UITextField!
    @IBOutlet weak var mConfirmCurrencyTF: UITextField!
    @IBOutlet weak var mDurationTF: UITextField!
    @IBOutlet weak var mPayMethodTF: UITextField!
    
    let mPayMethods = ["MPESA"]
    let mDurations = ["1 week", "2 weeks", "3 weeks", "1 month"]
    
    let payPicker = UIPickerView()
    let durationPicker = UIPickerView()
    var countryPicker: CountryPicker!
    var confrimCountryPicker: CountryPicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Borrow"
        setBackButton(vc: self, selector: #selector(onBack))
        
        payPicker.delegate = self
        mPayMethodTF.inputView = payPicker
        mPayMethodTF.text = mPayMethods[0]
        durationPicker.delegate = self
        mDurationTF.inputView = durationPicker
        mDurationTF.text = mDurations[3]
        
        setupView()
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
    
    private func setupView() {
        countryPicker = CountryPicker()
        countryPicker.setupWithCurrency(true)
        countryPicker.countryPickerDelegate = self
        countryPicker.showPhoneNumbers = true
        countryPicker.setTryCurrentCountry()
        mCurrencyTF.inputView = countryPicker
        
        confrimCountryPicker = CountryPicker()
        confrimCountryPicker.setupWithCurrency(true)
        confrimCountryPicker.countryPickerDelegate = self
        confrimCountryPicker.showPhoneNumbers = true
        confrimCountryPicker.setTryCurrentCountry()
        mConfirmCurrencyTF.inputView = confrimCountryPicker
    }
    
    // Mark:
    // Mark: - CountryPickerDelegate
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountry: Country) {
        if picker == countryPicker {
            mCurrencyTF.text = didSelectCountry.currency!
        } else {
            mConfirmCurrencyTF.text = didSelectCountry.currency!
        }
    }
    
    @IBAction func onBorrow(_ sender: Any) {
        toast(message: "Borrow")
    }
}

extension Save3xVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == payPicker {
            return mPayMethods.count
        } else {
            return mDurations.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == payPicker {
            return mPayMethods[row]
        } else {
            return mDurations[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == payPicker {
            mPayMethodTF.text = mPayMethods[row]
        } else {
            mDurationTF.text = mDurations[row]
        }
    }
}
