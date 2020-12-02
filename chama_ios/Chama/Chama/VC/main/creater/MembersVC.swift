//
//  MembersVC.swift
//  Chama
//
//  Created by Star on 21/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit

class MembersVC: SideMenuMainBaseVC {
    public static let MODE_MEMBERS = "members"
    public static let MODE_NON_CONTRIBUTED_USERS = "non_contributed_users"
    public var mType = MembersVC.MODE_MEMBERS

    @IBOutlet weak var mTableView: UITableView!
    
    var mDatas = Array<User>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if mType == MembersVC.MODE_MEMBERS {
            self.title = "Members"
        } else {
            self.title = "Pending Members Contributions"
        }
        
        setBackButton(vc: self, selector: #selector(onBack))
        
        getData()
        self.mTableView.reloadData()
        
        /*
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.onMemberCellAction),
            name: NSNotification.Name(rawValue: "MemberCell_Action"),
            object: nil)
         */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showNavigationBar(ViewController: self)
    }
    
    /*
    @objc func onMemberCellAction (notification: NSNotification) {
        if let viewId = notification.userInfo!["key"] as? String {
            if let type = notification.userInfo!["type"] as? String {
                
            }
        }
    }
    */
    
    func getData() {
        var u = User()
        u.u_id = "1"
        u.name = "Alex"
        u.phone = "+254234234234"
        u.role = User.TYPE_CHAIRPERSON
        u.photo = "http://104.248.7.157/Qonect/assets/uploads/profile_photo/photo_1550124013484.jpg"
        u.group_id = "1"
        u.chama_name = "My Group"
        u.chama_code = "my_code"
        u.status = User.STATUS_ACTIVE
        mDatas.append(u)
        
        u = User()
        u.u_id = "1"
        u.name = "Alex"
        u.phone = "+254234234234"
        u.role = User.TYPE_SECRETARY
        u.photo = "http://104.248.7.157/Qonect/assets/uploads/profile_photo/photo_1550124013484.jpg"
        u.group_id = "1"
        u.chama_name = "My Group"
        u.chama_code = "my_code"
        u.status = User.STATUS_ACTIVE
        mDatas.append(u)
        
        u = User()
        u.u_id = "1"
        u.name = "Alex"
        u.phone = "+254234234234"
        u.role = User.TYPE_TREASURE
        u.photo = "http://104.248.7.157/Qonect/assets/uploads/profile_photo/photo_1550124013484.jpg"
        u.group_id = "1"
        u.chama_name = "My Group"
        u.chama_code = "my_code"
        u.status = User.STATUS_ACTIVE
        mDatas.append(u)
        
        u = User()
        u.u_id = "1"
        u.name = "Alex"
        u.phone = "+254234234234"
        u.role = User.TYPE_MEMBER
        u.photo = "http://104.248.7.157/Qonect/assets/uploads/profile_photo/photo_1550124013484.jpg"
        u.group_id = "1"
        u.chama_name = "My Group"
        u.chama_code = "my_code"
        u.status = User.STATUS_ACTIVE
        mDatas.append(u)
        
        u = User()
        u.u_id = "1"
        u.name = "Alex"
        u.phone = "+254234234234"
        u.role = User.TYPE_MEMBER
        u.photo = "http://104.248.7.157/Qonect/assets/uploads/profile_photo/photo_1550124013484.jpg"
        u.group_id = "1"
        u.chama_name = "My Group"
        u.chama_code = "my_code"
        u.status = User.STATUS_SUSPEND
        mDatas.append(u)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MembersVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        //return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mDatas.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let d = mDatas[indexPath.row]
        let cell = self.mTableView.dequeueReusableCell(withIdentifier: "RID_MemberCell") as! MemberCell
        cell.setData(d, viewID: String(indexPath.row))
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let d = mDatas[indexPath.row]
        let vc = getVC("MemberDetailVC") as! MemberDetailVC
        vc.mUser = d
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
