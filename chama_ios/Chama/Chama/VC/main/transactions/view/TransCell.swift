//
//  TransCell.swift
//  Chama
//
//  Created by Star on 14/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit


class TransCell: UITableViewCell {
    
    @IBOutlet weak var mDescLB: UILabel!
    @IBOutlet weak var mAmountLB: UILabel!
    @IBOutlet weak var mDateLB: UILabel!
    
    public var mViewID: String!
    public var mData: BaseModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func setData(_ data: BaseModel, viewID: String) {
        self.mViewID = viewID
        self.mData = data
        
        if data.isKind(of: TransMD.self) {
            var desc = ""
            let data = mData as! TransMD
            if data.type == TransMD.TYPE_CONTRIBUTE {
                desc = "Contributed"
            } else if data.type == TransMD.TYPE_BORROW {
                desc = "Borrowed"
            } else if data.type == TransMD.TYPE_LOANS {
                desc = "Loaned"
            } else if data.type == TransMD.TYPE_BACK {
                desc = "Paid back"
            } else if data.type == TransMD.TYPE_WITHDRAW {
                desc = "Withdraw"
            }
            
            mDescLB.text = desc
            mAmountLB.text = data.getAmount()
            mDateLB.text = data.duedate
        } else if data.isKind(of: LoanMD.self) {
            let data = mData as! LoanMD
            
            mDescLB.text = data.username
            mAmountLB.text = data.getAmount()
            mDateLB.text = data.duedate
        }        
    }
}
