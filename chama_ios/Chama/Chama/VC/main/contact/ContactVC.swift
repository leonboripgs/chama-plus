//
//  ContactVC.swift
//  Chama
//
//  Created by Star on 14/2/2019.
//  Copyright © 2019 Star. All rights reserved.
//

import UIKit
import MessageUI

class ContactVC: SideMenuMainBaseVC, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var mPhoneBtn: UIButton!
    @IBOutlet weak var mEmailBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Contact Us"
        self.mPhoneBtn.setTitle("+" + SUPPORT_PHONE, for: .normal)
        self.mEmailBtn.setTitle(SUPPORT_EMAIL, for: .normal)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onCall(_ sender: Any) {
        /*
        let url: NSURL = URL(string: "TEL://" + SUPPORT_PHONE)! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        */
        
        UIApplication.shared.open(URL(string:"https://api.whatsapp.com/send?phone=" + SUPPORT_PHONE)!, options: [:], completionHandler: nil)

    }
    
    @IBAction func onEmail(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([SUPPORT_EMAIL])
        mailComposerVC.setSubject("")
        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        showSimpleAlert(self, title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", okAction: {
            
            })
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
