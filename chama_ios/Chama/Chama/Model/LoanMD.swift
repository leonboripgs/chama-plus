//
//  LoanMD.swift
//  Chama
//
//  Created by Star on 15/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class LoanMD: BaseModel {
    
    public static let TYPE_EMERGENCY = "emergency_fund"
    public static let TYPE_3X = "3x_my_saving"

    var l_id: String!
    var username: String!
    var currency: String!
    var amount: String!
    var duedate: String!
    var type: String!
    
    override func getID () -> String {
        return l_id
    }
    
    func getAmount() -> String {
        return amount + " " + currency
    }
}
