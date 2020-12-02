//
//  ProfileVC.swift
//  Chama
//
//  Created by Star on 14/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit
import DKImagePickerController
import SDWebImage

class ProfileVC: SideMenuMainBaseVC, CountryPickerDelegate {

    @IBOutlet weak var mPhotoIV: UIImageView!
    @IBOutlet weak var mNameTF: UITextField!
    @IBOutlet weak var mCodeTF: UITextField!
    @IBOutlet weak var mPhotoTF: UITextField!
    @IBOutlet weak var mChamaNameLB: UILabel!
    @IBOutlet weak var mChamaCodeLB: UILabel!
    @IBOutlet weak var mChamaRuleLB: UILabel!
    @IBOutlet weak var mWithdrawBtn: UIButton!
    
    var countryPicker: CountryPicker!
    var mPhoto: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Profile"
        
        setupView()
    }
    
    private func setupView() {
        countryPicker = CountryPicker()
        countryPicker.setupWithCountries(APPS_COUNTRIES)
        
        //countryPicker.setup()
        countryPicker.countryPickerDelegate = self
        countryPicker.showPhoneNumbers = true
        
        countryPicker.setTryCurrentCountry()
        
        mCodeTF.inputView = countryPicker
    }
    
    // Mark:
    // Mark: - CountryPickerDelegate
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountry: Country) {
        mCodeTF.text = "+" + didSelectCountry.phoneCode!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onPhoto(_ sender: Any) {
        let pickerController = DKImagePickerController()
        pickerController.singleSelect = true
        
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            if assets.count > 0 {
                let asset: DKAsset = assets[0]
                asset.fetchFullScreenImage(completeBlock: {image, info in
                    self.mPhotoIV.image = image
                    self.mPhoto = image
                })
                /*
                asset.fetchImage(with: self.mPhotoIV.frame.size, completeBlock: { image, info in
                    self.mPhotoIV.image = image
                    self.mPhoto = image
                })*/
            }
        }
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            pickerController.modalPresentationStyle = .formSheet
        }
        
        self.present(pickerController, animated: true) {}
    }
    
    @IBAction func onSave(_ sender: Any) {
        if mPhoto != nil {
            //updatePhoto()
        }
        toast(message: "Save")
    }
    
    @IBAction func onWithdraw(_ sender: Any) {
        toast(message: "Withdraw")
    }
    
}
