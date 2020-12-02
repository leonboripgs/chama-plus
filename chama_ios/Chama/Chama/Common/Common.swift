//
//  Common.swift
//  GoldenCoin
//
//  Created by Star on 6/28/17.
//  Copyright © 2017 Star. All rights reserved.
//

import UIKit
import Toast_Swift
import JGProgressHUD
import SwiftLog
import Localize_Swift


/*************************************************/
/*                     Samples                   */
/*************************************************/
/*
func showImagePicker () {
    let pickerController = DKImagePickerController()
    pickerController.singleSelect = true
    
    pickerController.didSelectAssets = { (assets: [DKAsset]) in
         if assets.count > 0 {
             let asset: DKAsset = assets[0]
             asset.fetchImage(with: self.mPhotoIV.frame.size, completeBlock: { image, info in
             self.mPhotoIV.image = image
             })
         }
    }
    
    if UI_USER_INTERFACE_IDIOM() == .pad {
        pickerController.modalPresentationStyle = .formSheet
    }
    
    self.present(pickerController, animated: true) {}
}
*/



/*************************************************/
/*                      General                  */
/*************************************************/

var hud: JGProgressHUD?


func getAppDelegate() -> AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
}

func instanceFromNib(NibFileName nib: String) -> UIView {
    return UINib(nibName: nib, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
}

func getHUD() -> JGProgressHUD {
    if hud == nil {
        hud = JGProgressHUD(style: .extraLight)
    }
    
    return hud!
}

func log(_ msg: String) {
    logw(msg)
}

func showLoading(_ parentView: UIView) {
    DispatchQueue.main.async {
        hud = getHUD()
        hud?.textLabel.text = "Please wait..."
        hud?.show(in: parentView)
    }
}

func showLoading() {
    DispatchQueue.main.async {
        hud = getHUD()
        hud?.textLabel.text = "Please wait..."
        hud?.show(in: (getAppDelegate().window?.rootViewController?.view)!)
    }
}

func showLoadingWithText(_ message: String) {
    DispatchQueue.main.async {
        hud = getHUD()
        hud?.textLabel.text = message
        hud?.show(in: (getAppDelegate().window?.rootViewController?.view)!)
    }
}

func showLoadingDismissAfterDelay(_ second: Int) {
    DispatchQueue.main.async {
        hud = getHUD()
        hud?.textLabel.text = "Please wait..."
        hud?.show(in: (getAppDelegate().window?.rootViewController?.view)!)
        hud?.dismiss(afterDelay: TimeInterval(second))
    }
}

func dismissLoading() {
    DispatchQueue.main.async {
        hud = getHUD()
        hud?.dismiss()
    }
}

func dismissLoadingAfterDelay(_ second: Int) {    
    DispatchQueue.main.async {
        hud = getHUD()
        hud?.dismiss(afterDelay: TimeInterval(second))
    }
}

func toast(message: String, view: UIView = getAppDelegate().window!) {
    view.makeToast(message)
}

func outShadow(view: UIView,
               shadowRadius: Int,
               shadowOpacity: Float = 0.5,
               shadowColor: UIColor = GRAY_COLOR) {
    
    view.layer.shadowRadius = CGFloat(shadowRadius)
    view.layer.shadowOpacity = shadowOpacity
    view.layer.shadowColor = shadowColor.cgColor
    view.layer.shadowOffset = CGSize.zero
    
    view.outerShadow()
}

var Timestamp: String {
    return "\(NSDate().timeIntervalSince1970 * 1000)"
}

// NSUserDefault Part
func getValue(_ key: String)->String {
    return UserDefaults.standard.value(forKey: key) as? String ?? ""
}

func saveValue(_ value: String, key: String) {
    
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}

func deleteValue(_ key: String) {
    
    UserDefaults.standard.removeObject(forKey: key)
    UserDefaults.standard.synchronize()
}
// End

func isIncludeSubString(_ str: String!, subStr: String!, lowercase: Bool) -> Bool {
    
    var result: Bool = false;
    if(lowercase) {
        // alternative: not case sensitive
        if str.lowercased().range(of:subStr) != nil {
            result = true
        }
    } else {
        if str.range(of:subStr) != nil {
            result = true
        }
    }
    return result
}

func showSimpleAlert(_ vc: UIViewController,
                     title: String,
                     message: String,
                     okAction: @escaping () -> Void) {
    
    let alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert)
    
    let cancelaction = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) in
        print("You've pressed cancel");
    }
    
    let okaction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
        print("You've pressed default");
        okAction()
    }
    
    alertController.addAction(cancelaction)
    alertController.addAction(okaction)
    vc.present(alertController, animated: true, completion: nil)
}

func goToWebsite(_ url: String) {
    if #available(iOS 10, *) {
        if let u = NSURL(string: url) as URL? {
            UIApplication.shared.open(u, options: [:],
                                      completionHandler: {
                                        (success) in
                                        print("Open \(url): \(success)")
            })
        } else {
            print("Invalid URL")
        }
    } else {
        if let u = NSURL(string: url) as URL? {
            let success = UIApplication.shared.openURL(u)
            print("Open \(url): \(success)")
        } else {
            print("Invalid URL")
        }
    }
}

func convertToDictionary(text: String?) -> [String: Any]? {
    guard let text = text else {
        return [:]
    }
    
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

func toJSonString(_ data : Any) -> String {
    
    var jsonString = "";
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
        jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
    } catch {
        print(error.localizedDescription)
    }
    return jsonString;
}

func getDate() {
    
    let date = Date()
    var calendar = Calendar.current
    calendar.timeZone = TimeZone(abbreviation: "UTC")!
    let components = calendar.dateComponents([.hour, .minute, .weekday], from: date)
    
    let hour = components.hour
    let minute = components.minute
    let weekday = components.weekday
    
    print(hour!)
    print(minute!)
    print(weekday!)
}

func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

func isValidPassword(_ password: String) -> Bool {
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[-=\\[\\];,./~!@#$%^&*()|:<>?\\`+_\\{\\}\\'\"\\\\])(?=.*[0-9])(?=.*[a-z]).{8,}$")
    return passwordTest.evaluate(with: password)
}

func isValidPasswordForLength(_ password: String) -> Bool {
    var result = false
    if password.count > 4 {
        result = true
    }
    return result
}

func isValidPasswordForLowercase(_ password: String) -> Bool {
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z]).{1,}$")
    return passwordTest.evaluate(with: password)
}

func isValidPasswordForUppercase(_ password: String) -> Bool {
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z]).{1,}$")
    return passwordTest.evaluate(with: password)
}

func isValidPasswordForNumber(_ password: String) -> Bool {
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[0-9]).{1,}$")
    return passwordTest.evaluate(with: password)
}

func isValidPasswordForSpecialCharacter(_ password: String!) -> Bool {    
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[-=\\[\\];,./~!@#$%^&*()|:<>?\\`+_\\{\\}\\'\"\\\\]).{1,}$")
    return passwordTest.evaluate(with: password)
}

// UIPart

func hideNavigationBar(ViewController vc:UIViewController) {
    vc.navigationController?.isNavigationBarHidden = true
}

func showNavigationBar(ViewController vc:UIViewController) {
    vc.navigationController?.isNavigationBarHidden = false
}

func hideBackButton(vc: UIViewController) {
    vc.navigationItem.setHidesBackButton(true, animated:false);
    vc.navigationItem.leftBarButtonItem = nil;
}

func setBackButton(vc:UIViewController, selector:Selector) {
    
    let imageview = UIImageView(frame: CGRect(x: 0, y: 11, width: 13, height: 20))
    imageview.image = UIImage(named: "ic_back.png")
    
    let btn = UIButton(type: .custom)
    btn.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
    btn.addSubview(imageview)
    btn.addTarget(vc, action: selector, for: .touchUpInside)
    let item = UIBarButtonItem(customView: btn)
    
    vc.navigationItem.setLeftBarButtonItems([item], animated: true)
}

func setLeftToggleBtn(vc:UIViewController, selector:Selector) {
    
    let imageview = UIImageView(frame: CGRect(x: 0, y: 12, width: 20, height: 15))
    imageview.image = UIImage(named: "ic_toggle.png")
    
    let btn = UIButton(type: .custom)
    btn.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
    btn.addSubview(imageview)
    btn.addTarget(vc, action: selector, for: .touchUpInside)
    let item = UIBarButtonItem(customView: btn)
    
    vc.navigationItem.setLeftBarButtonItems([item], animated: true)
}

func setLeftButton(vc:UIViewController, selector:Selector?, imgName: String, btnWidth: CGFloat, btnHeight: CGFloat) {
    let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: btnWidth, height: btnHeight))
    imageview.image = UIImage(named: imgName)
    
    let btn = UIButton(type: .custom)
    //btn.setImage(UIImage(named: imgName), for: .normal)
    btn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnHeight)
    if(selector != nil) {
        btn.addTarget(vc, action: (selector)!, for: .touchUpInside)
    }
    btn.addSubview(imageview)
    let item = UIBarButtonItem(customView: btn)
    vc.navigationItem.setLeftBarButtonItems([item], animated: true)
}

func setRightButton(vc:UIViewController, selector:Selector, image: UIImage) {
    let imageview = UIImageView(frame: CGRect(x: 26, y: 13, width: 20, height: 20))// 46 x 46
    imageview.image = image
    
    let btn = UIButton(type: .custom)
    //btn.setImage(image, for: .normal)
    btn.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
    btn.addSubview(imageview)
    btn.addTarget(vc, action: selector, for: .touchUpInside)
    let item = UIBarButtonItem(customView: btn)
    vc.navigationItem.setRightBarButtonItems([item], animated: true)
}

// NSData to BASE64 string
func getBase64StringFromData(_ data: NSData) -> String {
    let strBase64 = data.base64EncodedString(options: .lineLength64Characters)
    return strBase64
}

// BASE64 string to NSData
func getDataFromBase64String(_ strBase64: String) -> NSData {
    let imageData : Data = Data(base64Encoded: strBase64, options: .ignoreUnknownCharacters)!
    return imageData as NSData
}

// image to BASE64 string
func getBase64StringFromImage(_ image: UIImage) -> String {
    let imageData = image.jpegData(compressionQuality: 0.5)
    let strBase64 = imageData?.base64EncodedString(options: .lineLength64Characters)
    return strBase64!
}

// BASE64 string to image
func getImageFromBase64String(_ strBase64: String) -> UIImage {
    let imageData : Data = Data(base64Encoded: strBase64, options: .ignoreUnknownCharacters)!
    let image = UIImage(data:imageData,scale:1.0)
    return image!
}

func getHeightOfTextView(textView:UITextView, content:String) -> CGFloat {
    let fixedWidth = textView.frame.size.width
    textView.text = content
    textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
    let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
    return newSize.height
}

func getHeightOfLabel(label:UILabel, content:String) -> CGFloat {
    let fixedWidth = label.frame.size.width
    label.text = content
    label.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
    let newSize = label.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
    return newSize.height
}

func makeRoundBorder(view:UIView, radius:CGFloat, width:CGFloat, lineColor:CGColor) {
    view.layer.cornerRadius = radius;
    view.layer.masksToBounds = true;
    view.layer.borderWidth = width;
    view.layer.borderColor = lineColor
}

func makeCircleOutLine(view:UIView, lineColor:CGColor) {
    view.layer.cornerRadius = view.frame.size.width/2;
    view.layer.masksToBounds = true;
    view.layer.borderWidth = 0.5;
    view.layer.borderColor = lineColor
}

func currentTimeStamp() -> Double {
    return NSDate().timeIntervalSince1970
}

func convertTimestampTo36 (_ ts: NSInteger) -> String {
    let sampleChr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    //let sampleChr = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let num = sampleChr.count
    
    var source = ts
    var result = ""
    while source > 0 {
        let rm = source % num
        source = source / num
        let startIndex = sampleChr.index(sampleChr.startIndex, offsetBy: rm)
        let endIndex = sampleChr.index(sampleChr.startIndex, offsetBy: rm+1)
        let range = startIndex..<endIndex
        
        result = result + sampleChr[range]
    }
    
    return result
}

func random36() -> String {
    let sourceLong = Int(currentTimeStamp()*1000)
    let time36 = convertTimestampTo36(sourceLong)
    
    return time36
}

func encNumberToStr (_ number: String) -> String {
    let sampleChr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var enc = ""
    for i in 0 ..< number.count {
        let numstr = number.getSubString(from: i, to: i+1)
        if let num = Int(numstr) {
            enc = enc + sampleChr.getSubString(from: num, to: num+1)
        } else {
            enc = enc + numstr
        }
    }
    
    return enc
}


class Common: NSObject {
    
    // Main Board Background Color 202020
    // Secondary Board Background Color F8C52D
    // Golden Text color F9C023
    // Golden Button Background Color F9B218        
}
