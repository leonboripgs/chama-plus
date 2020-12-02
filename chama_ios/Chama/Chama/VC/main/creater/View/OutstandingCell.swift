//
//  OutstandingCell.swift
//  Chama
//
//  Created by Star on 24/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class OutstandingCell: UITableViewCell {
    
    @IBOutlet weak var mDescLB: UILabel!
    @IBOutlet weak var mAmountLB: UILabel!
    @IBOutlet weak var mDateLB: UILabel!
    @IBOutlet weak var mWarningIV: UIImageView!
    @IBOutlet weak var mLeftDateLB: UILabel!
    
    public var mViewID: String!
    public var mData: OutstandingMD!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setData(_ data: OutstandingMD, viewID: String) {
        self.mViewID = viewID
        self.mData = data
        
        mDescLB.text = data.username + " Borrowed"
        mAmountLB.text = data.getBorrowedAmount()
        mDateLB.text = data.getDuringDays()
        
        if Int(mViewID)! > 3 {
            mLeftDateLB.text = "(3 days passed)"
            mWarningIV.isHidden = false
        } else {
            mLeftDateLB.text = "(2 days left)"
            mWarningIV.isHidden = true
        }
    }

}
