//
//  MemberCell.swift
//  Chama
//
//  Created by Star on 21/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class MemberCell: UITableViewCell {
    
    @IBOutlet weak var mPhotoIV: UIImageView!
    @IBOutlet weak var mBlockMaskIV: UIImageView!
    @IBOutlet weak var mNameLB: UILabel!
    @IBOutlet weak var mRoleLB: UILabel!
    
    public var mViewID: String!
    public var mData: User!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setData(_ data: User, viewID: String) {
        self.mViewID = viewID
        self.mData = data
        
        mNameLB.text = data.name
        mRoleLB.text = data.role
        if data.status == User.STATUS_ACTIVE {
            mBlockMaskIV.isHidden = true
        } else {
            mBlockMaskIV.isHidden = false
        }
        mPhotoIV.sd_setImage(with: URL(string: data.photo), completed: nil)
        
    }

    /*
    @IBAction func onRole(_ sender: Any) {
        let data: [String: String] = ["key": mViewID, "type": "role"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MemberCell_Action"),
                                        object: nil, userInfo: data)
    }
    
    @IBAction func onOption(_ sender: Any) {
        let data: [String: String] = ["key": mViewID, "type": "option"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MemberCell_Action"),
                                        object: nil, userInfo: data)
    }
    */
}
