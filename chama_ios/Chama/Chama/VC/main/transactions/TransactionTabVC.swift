//
//  TransactionTabVC.swift
//  Chama
//
//  Created by Star on 14/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit
import Material

class TransactionTabVC: TabsController, TabBarDelegate {

    open override func prepare() {
        super.prepare()
        
        tabBarAlignment = .top
        tabBar.tabBarStyle = .auto
        tabBar.dividerColor = UIColor(rgb: 0xeeeeee, a: 1.0)
        tabBar.dividerAlignment = .bottom
        tabBar.lineHeight = 2.0
        tabBar.lineColor = PRIMARY_COLOR
        tabBar.lineAlignment = .bottom
        tabBar.backgroundColor = WHITE_COLOR
        
        for btn: TabItem in tabBar.tabItems {
            btn.setTitleColor(DARK_COLOR, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        }
        
        tabBar.selectedTabItem?.setTitleColor(ACTIVE_COLOR, for: .normal)
        
        tabBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Transactions"
        hideBackButton(vc: self)
        setLeftToggleBtn(vc: self, selector: #selector(showMeMyMenu))
    }
    
    @objc func showMeMyMenu () {
        if let container = self.so_containerViewController {
            container.isSideViewControllerPresented = true
        }
    }
    
    @objc
    func tabBar(tabBar: TabBar, didSelect tabItem: TabItem) {
        
        for btn: TabItem in tabBar.tabItems {
            btn.setTitleColor(DARK_COLOR, for: .normal)
        }
        
        tabItem.setTitleColor(ACTIVE_COLOR, for: .normal)
        
        var newIndex = 0
        for i in 0 ..< tabBar.tabItems.count {
            if tabItem == tabBar.tabItems[i] {
                newIndex = i
            }
        }
        
        let nc = NotificationCenter.default
        nc.post(name:Notification.Name(rawValue:"TransactionTopTabClicked"),
                object: nil,
                userInfo: ["TabId":String(newIndex)])
    }

}
