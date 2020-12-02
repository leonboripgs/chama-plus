//
//  Extentions.swift
//  Kinect
//
//  Created by Star on 25/10/2018.
//  Copyright © 2018 Star. All rights reserved.
//

import UIKit

class Extentions: NSObject {

}

/*************************************************/
/*               UIView extension               */
/*************************************************/

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    open func outerShadow() {
        if self.tag == 99999 {
            return
        }
        
        self.tag = 99999
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = layer.cornerRadius
        view.layer.shadowRadius = layer.shadowRadius
        view.layer.shadowOpacity = layer.shadowOpacity
        view.layer.shadowColor = layer.shadowColor
        view.layer.shadowOffset = CGSize.zero
        view.clipsToBounds = false
        view.backgroundColor = .white
        
        superview?.insertSubview(view, belowSubview: self)
        
        let constraints = [
            NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            ]
        superview?.addConstraints(constraints)
    }
}

/*************************************************/
/*               UIColor extension               */
/*   ex:  let color = UIColor(argb: 0xFFFFFFFF)  */
/*************************************************/
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
    
    func inverse () -> UIColor {
        var r:CGFloat = 0.0; var g:CGFloat = 0.0; var b:CGFloat = 0.0; var a:CGFloat = 0.0;
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: -r, green: -g, blue: -b, alpha: a)
        }
        return .black // Return a default colour
    }
}

/*************************************************/
/*               UIImage extension               */
/*************************************************/
extension UIImage {
    
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    //???
    func resized(newWidth: CGFloat, newHeight: CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        
        draw(in: CGRect(x: 0, y: 0,width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in PNG format
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the PNG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    var png: Data? { return self.pngData() }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ quality: JPEGQuality) -> Data? {
        return self.jpegData(compressionQuality: quality.rawValue)
    }
}

/*************************************************/
/*             UIImageView extention             */
/*************************************************/

extension UIImageView {
    func setImageRenderingMode(_ renderMode: UIImage.RenderingMode) {
        assert(image != nil, "Image must be set before setting rendering mode")
        // AlwaysOriginal as an example
        //image = image?.withRenderingMode(.alwaysOriginal) //0- auto, 1- origin, 2- template
        //image = image?.withRenderingMode(.alwaysTemplate)
        image = image?.withRenderingMode(renderMode)
    }
}

/*************************************************/
/*               String extention                */
/*************************************************/
extension String {
        
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    // from: nth of start charactor from start
    // to: nth of end charactor from start
    // ex: str = "Transfer"
    //     str.getSubString(from: 1, to: 6) = "ransf"
    func getSubString(from: Int, to: Int) -> String {
        var subStr: String = ""
        
        let count = self.count
        if from > count || to > count {
            return subStr
        }
        
        let start = self.index(self.startIndex, offsetBy: from)
        let end = self.index(self.startIndex, offsetBy: to)
        let range = start..<end
        
        subStr = String(self[range])
        
        return subStr
    }
    
    // from: nth of start charactor from start
    // count: count
    // ex: str = "Transfer"
    //     str.getSubString(from: 1, to: 6) = "ransfe"
    func getSubString(from: Int, count: Int) -> String {
        var subStr: String = ""
        
        let to = from + count
        if from > self.count || to > self.count {
            return subStr
        }
        
        let start = self.index(self.startIndex, offsetBy: from)
        let end = self.index(self.startIndex, offsetBy: to)
        let range = start..<end
        
        subStr = String(self[range])
        
        return subStr
    }
    
    func isIncludeSubString(_ keyStr: String!, lowercase: Bool = true) -> Bool {
        
        var result: Bool = false;
        if(lowercase) {
            // alternative: not case sensitive
            if self.lowercased().range(of:keyStr) != nil {
                result = true
            }
        } else {
            if self.range(of:keyStr) != nil {
                result = true
            }
        }
        return result
    }
}

/*************************************************/
/*        NSAttributedString extension           */
/*************************************************/
extension NSAttributedString {
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.width)
    }
}

/*************************************************/
/*                 Date extension                */
/*************************************************/
extension Date {
    func getNextDay() -> Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    func getPreviousDay() -> Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    func getNextDay(_ date: Date) -> Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: date)!
    }
    
    func getPreviousDay(_ date: Date) -> Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: date)!
    }
    
    func getNextMonth() -> Date {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)!
    }
    
    func getPreviousMonth() -> Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)!
    }
    
    func getNextMonth(_ date: Date) -> Date {
        return Calendar.current.date(byAdding: .month, value: 1, to: date)!
    }
    
    func getPreviousMonth(_ date: Date) -> Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: date)!
    }
    
    func getStringFromDate(_ format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = format
        return dateformatter.string(from: self)
    }
}

/*************************************************/
/*                 NSDate extension              */
/*************************************************/
extension NSDate {
    class func dateByAddingDays(days: Int) -> NSDate {
        return self.days(days: days)
    }
    
    class func dateBySubstractingDays(days: Int) -> NSDate {
        return NSDate.days(days: -days)
    }
    
    class func days(days:Int) -> NSDate {
        return (NSCalendar.current as NSCalendar).date( byAdding: [.day], value: days, to: NSDate() as Date, options: [] )! as NSDate
    }
    
    class func dateAtPrevMidnight() -> NSDate? {
        
        let date                = NSDate.dateBySubstractingDays(days: 1)
        let calendar            = NSCalendar.current
        //let components          = calendar.components(.year, .month, .day, .hour, .minute, .second, fromDate: date)
        let components          = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date as Date)
        
        // Specify date components
        let dateComponents      = NSDateComponents()
        dateComponents.year     = components.year!
        dateComponents.month    = components.month!
        dateComponents.day      = components.day!
        dateComponents.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        dateComponents.hour     = 0
        dateComponents.minute   = 0
        dateComponents.second   = 0
        
        // Create date from components
        let userCalendar    = NSCalendar.current
        //let dateTime        = userCalendar.dateFromComponents(dateComponents)
        let dateTime        = userCalendar.date(from: dateComponents as DateComponents)
        
        return (dateTime! as NSDate)
    }
}

/*************************************************/
/*               UIDevice extension              */
/*************************************************/
extension UIDevice {
    var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
}
