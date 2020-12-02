//
//  CountryPicker.swift
//  Hyber
//
//  Created by Taras on 12/1/16.
//  Copyright © 2016 Taras Markevych. All rights reserved.
//

import UIKit
import CoreTelephony

@objc public protocol CountryPickerDelegate {
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountry: Country)
}

open class CountryPicker: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var countries: [Country]!
    open weak var countryPickerDelegate: CountryPickerDelegate?
    open var showPhoneNumbers: Bool = true
    open var showCurrency: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        countries = getAllCountries()
        super.dataSource = self
        super.delegate = self
    }
    
    func setupWithCurrency(_ isCurrency: Bool = false) {
        countries = getAllCountries()
        super.dataSource = self
        super.delegate = self
        showCurrency = isCurrency
    }
    
    open func setupWithCountries (_ filterCountryNames: Array<String>, isCurrency: Bool = false) {
        countries = getCountries(filterCountryNames)
        super.dataSource = self
        super.delegate = self
        showCurrency = isCurrency
        self.reloadAllComponents()
    }
    
    open func setTryCurrentCountry() {
        let locale = Locale.current
        let code = (locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String?
        
        self.setCountryByCode(code!)
    }
    
    // MARK: - Country Methods
    
    open func setCountryByName(_ name: String) {
        var row = 0
        for index in 0..<countries.count {
            if countries[index].name == name {
                row = index
                break
            }
        }
        
        self.selectRow(row, inComponent: 0, animated: true)
        let country = countries[row]
        if let countryPickerDelegate = countryPickerDelegate {
            countryPickerDelegate.countryPhoneCodePicker(self, didSelectCountry: country)
        }
    }
    
    open func setCountryByCode(_ codeTxt: String) {
        var row = 0
        for index in 0..<countries.count {
            if countries[index].codeTxt == codeTxt {
                row = index
                break
            }
        }
        
        self.selectRow(row, inComponent: 0, animated: true)
        let country = countries[row]
        if let countryPickerDelegate = countryPickerDelegate {
            countryPickerDelegate.countryPhoneCodePicker(self, didSelectCountry: country)
        }
    }
    
    open func setCountryByCountryCodeNumber(_ countryCodeNumber: String) {
        var row = 0
        for index in 0..<countries.count {
            if countries[index].countryCodeNumber == countryCodeNumber {
                row = index
                break
            }
        }
        
        self.selectRow(row, inComponent: 0, animated: true)
        let country = countries[row]
        if let countryPickerDelegate = countryPickerDelegate {
            countryPickerDelegate.countryPhoneCodePicker(self, didSelectCountry: country)
        }
    }
    
    open func setCountryByPhoneCode(_ phoneCode: String) {
        var row = 0
        for index in 0..<countries.count {
            if countries[index].phoneCode == phoneCode {
                row = index
                break
            }
        }
        
        self.selectRow(row, inComponent: 0, animated: true)
        let country = countries[row]
        if let countryPickerDelegate = countryPickerDelegate {
            countryPickerDelegate.countryPhoneCodePicker(self, didSelectCountry: country)
        }
    }        
    
    // MARK: - Picker Methods
    
    open func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    open func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    open func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    open func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //pickerView.backgroundColor = UIColor.black
        
        var resultView: CountryView
        
        if view == nil {
            resultView = CountryView()
        } else {
            resultView = view as! CountryView
        }
        
        resultView.setup(countries[row], isCurreny: showCurrency)
        if !showPhoneNumbers {
            resultView.countryCodeLabel.isHidden = true
        }
        return resultView
    }
    
    open func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let country = countries[row]
        if let countryPickerDelegate = countryPickerDelegate {
            countryPickerDelegate.countryPhoneCodePicker(self, didSelectCountry: country)
        }
    }
}
