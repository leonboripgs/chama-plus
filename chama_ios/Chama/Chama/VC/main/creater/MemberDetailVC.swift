//
//  MemberDetailVC.swift
//  Chama
//
//  Created by Star on 22/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

let ACCOUNT_STATUS = [User.STATUS_ACTIVE, User.STATUS_SUSPEND]
let ROLES = [User.TYPE_SECRETARY, User.TYPE_TREASURE, User.TYPE_MEMBER]

class MemberDetailVC: BaseVC {
    
    @IBOutlet weak var mPhotoIV: UIImageView!
    @IBOutlet weak var mNameLB: UILabel!
    @IBOutlet weak var mPhoneLB: UILabel!
    @IBOutlet weak var mChamaNameLB: UILabel!
    @IBOutlet weak var mChamaCodeLB: UILabel!
    @IBOutlet weak var mChamaRoleLB: UILabel!
    @IBOutlet weak var mStatusLB: UILabel!
    @IBOutlet weak var mRoleArrowIV: UIImageView!
    @IBOutlet weak var mStatusArrowIV: UIImageView!
    @IBOutlet weak var mRoleBtn: UIButton!
    @IBOutlet weak var mStatusBtn: UIButton!
    
    public var mUser: User!
    
    let rolePicker = UIPickerView()
    let statusPicker = UIPickerView()
    
    var textField : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = mUser.name
        setBackButton(vc: self, selector: #selector(onBack))
        
        initLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showNavigationBar(ViewController: self)
    }

    func initLayout() {
        rolePicker.delegate = self
        statusPicker.delegate = self
        
        if mUser.role == User.TYPE_CHAIRPERSON {
            mRoleArrowIV.isHidden = true
            mRoleBtn.isHidden = true
            mStatusArrowIV.isHidden = true
            mStatusBtn.isHidden = true
        } else {
            mStatusArrowIV.isHidden = false
            mStatusBtn.isHidden = false
            mRoleArrowIV.isHidden = false
            mRoleBtn.isHidden = false
        }
        
        mNameLB.text = mUser.name
        mPhoneLB.text = mUser.phone
        mChamaNameLB.text = mUser.chama_name
        mChamaCodeLB.text = mUser.chama_code
        mChamaRoleLB.text = mUser.role
        mStatusLB.text = mUser.status
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onRole(_ sender: Any) {
        if  textField == nil {
            self.textField = UITextField(frame:.zero)
            textField.inputView = self.rolePicker
            self.view.addSubview(textField)
        } else {
            textField.removeFromSuperview()
            self.textField = UITextField(frame:.zero)
            textField.inputView = self.rolePicker
            self.view.addSubview(textField)
        }
        
        if mUser.role == User.TYPE_CHAIRPERSON {
        } else if mUser.role == User.TYPE_SECRETARY {
            rolePicker.selectRow(0, inComponent: 0, animated: true)
        } else if mUser.role == User.TYPE_TREASURE {
            rolePicker.selectRow(1, inComponent: 0, animated: true)
        } else if mUser.role == User.TYPE_MEMBER {
            rolePicker.selectRow(2, inComponent: 0, animated: true)
        }
        
        textField.becomeFirstResponder()
    }
    
    @IBAction func onStatus(_ sender: Any) {
        if  textField == nil {
            self.textField = UITextField(frame:.zero)
            textField.inputView = self.statusPicker
            self.view.addSubview(textField)
        } else {
            textField.removeFromSuperview()
            self.textField = UITextField(frame:.zero)
            textField.inputView = self.statusPicker
            self.view.addSubview(textField)
        }
        
        if mUser.status == User.STATUS_ACTIVE {
            statusPicker.selectRow(0, inComponent: 0, animated: true)
        } else if mUser.status == User.STATUS_SUSPEND {
            statusPicker.selectRow(1, inComponent: 0, animated: true)
        }
        
        textField.becomeFirstResponder()
    }
    
    @IBAction func onSave(_ sender: Any) {
        
    }
}

extension MemberDetailVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == statusPicker {
            return ACCOUNT_STATUS.count
        } else {
            return ROLES.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == statusPicker {
            return ACCOUNT_STATUS[row]
        } else {
            return ROLES[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == statusPicker {
            mStatusLB.text = ACCOUNT_STATUS[row]
        } else {
            mChamaRoleLB.text = ROLES[row]
        }
    }
}
