//
//  User.swift
//  Chama
//
//  Created by Star on 21/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class User: BaseModel {

    public static let TYPE_CHAIRPERSON = "Chairperson"
    public static let TYPE_TREASURE = "Treasure"
    public static let TYPE_SECRETARY = "Secretary"
    public static let TYPE_MEMBER = "Member"
    
    public static let STATUS_ACTIVE = "Active"
    public static let STATUS_SUSPEND = "Suspend"
    
    var u_id: String!
    var name: String!
    var phone: String!
    var role: String!
    var photo: String!
    var group_id: String!
    var chama_name: String!
    var chama_code: String!
    var status: String!
}
