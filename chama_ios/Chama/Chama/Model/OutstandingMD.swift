//
//  OutstandingMD.swift
//  Chama
//
//  Created by Star on 24/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class OutstandingMD: BaseModel {
    
    var o_id: String!
    var username: String!
    var currency: String!
    var borrowed_amount: String!
    var loan_amount: String!
    var borrow_date: String!
    var schedule_loan_date: String!
    
    override func getID () -> String {
        return o_id
    }
    
    func getBorrowedAmount() -> String {
        return borrowed_amount + " " + currency
    }
    
    func getLoanAmount() -> String {
        return loan_amount + " " + currency
    }
    
    func getDuringDays() -> String {
        return borrow_date + " - " + schedule_loan_date;
    }
}
