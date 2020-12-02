//
//  BaseModel.swift
//  Kinect
//
//  Created by Star on 30/10/2018.
//  Copyright © 2018 Star. All rights reserved.
//

import UIKit
import EVReflection

class BaseModel: EVObject {
    var txt: String!
    
    public func Txt(_ t: String) -> BaseModel {
        txt = t
        return self
    }
    
    public func getID () -> String {
        return ""
    }
}
