//
//  Country.swift
//  MyCountryPicker
//
//  Created by Star on 3/9/18.
//  Copyright © 2018 Star. All rights reserved.
//

import UIKit

open class Country: NSObject {
    var codeTxt: String? // "CN"
    var countryCodeNumber: String? // "156"
    var name: String? // "China"
    var phoneCode: String? // "86"
    var currency: String? // "USD"
    var flag: UIImage?
    
    init(codeTxt: String?, countryCodeNumber: String?, name: String?, phoneCode: String?, currency: String, flag: UIImage?) {
        self.codeTxt = codeTxt
        self.countryCodeNumber = countryCodeNumber
        self.name = name
        self.phoneCode = phoneCode
        self.currency = currency
        self.flag = flag
    }
}

func getAllCountries() -> [Country] {
    var countries = [Country]()
    //let frameworkBundle = Bundle(for: type(of: self))
    let frameworkBundle =  Bundle.main
    guard let jsonPath = frameworkBundle.path(forResource: "CountryPicker.bundle/Data/countryCodes", ofType: "json"), let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
        return countries
    }
    
    do {
        if let jsonObjects = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? NSArray {
            
            for jsonObject in jsonObjects {
                
                guard let countryObj = jsonObject as? NSDictionary else {
                    return countries
                }
                
                guard let codeTxt = countryObj["code"] as? String, let countryCodeNumber = countryObj["country_code"] as? String, let currency = countryObj["currency"] as? String, let phoneCode = countryObj["dial_code"] as? String, let name = countryObj["name"] as? String else {
                    return countries
                }
                
                let flag = UIImage(named: "CountryPicker.bundle/Images/\(codeTxt.uppercased())", in: frameworkBundle, compatibleWith: nil)
                
                let country = Country(codeTxt: codeTxt, countryCodeNumber: countryCodeNumber, name: name, phoneCode: phoneCode, currency: currency, flag: flag)
                countries.append(country)
            }
            
        }
    } catch {
        return countries
    }
    return countries
}

func getCountries(_ filterCountyNames: Array<String>) -> Array<Country> {
    
    var fcountries = Array<Country>()
    let allCountries = getAllCountries()
    
    for fc in filterCountyNames {
        for c in allCountries {
            if c.name == fc {
                fcountries.append(c)
            }
        }
    }
    
    return fcountries
}

func getCountryByName(_ name: String) -> Country {
    let countries = getAllCountries()
    var row = 0
    for index in 0..<countries.count {
        if countries[index].name == name {
            row = index
            break
        }
    }
    
    return countries[row]
}

func getCountryByCodeTxt(_ codeTxt: String) -> Country {
    let countries = getAllCountries()
    var row = 0
    for index in 0..<countries.count {
        if countries[index].codeTxt == codeTxt {
            row = index
            break
        }
    }
    
    return countries[row]
}

func getCountryByPhoneCode(_ phoneCode: String) -> Country {
    let countries = getAllCountries()
    var row = 0
    for index in 0..<countries.count {
        if countries[index].phoneCode == phoneCode {
            row = index
            break
        }
    }
    
    return countries[row]
}
