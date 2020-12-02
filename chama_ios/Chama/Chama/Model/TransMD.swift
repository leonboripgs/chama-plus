//
//  CareerModel.swift
//  Kinect
//
//  Created by Star on 15/11/2018.
//  Copyright © 2018 Star. All rights reserved.
//

import UIKit

class TransMD: BaseModel {
    
    public static let TYPE_CONTRIBUTE = "contribute"
    public static let TYPE_BORROW = "borrow"
    public static let TYPE_LOANS = "loans"
    public static let TYPE_BACK = "back" //repay
    public static let TYPE_WITHDRAW = "withdraw"
    
    var t_id: String!
    var username: String!
    var currency: String!
    var amount: String!
    var duedate: String!
    var type: String!
    
    override func getID () -> String {
        return t_id
    }
    
    func getAmount() -> String {
        return amount + " " + currency
    }
    
}
