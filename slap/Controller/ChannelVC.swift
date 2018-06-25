//
//  ChannelVC.swift
//  slap
//
//  Created by Araz Sinjary on 5/23/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //outlet
    //why this button is outlet the reson is because we are going to need to change the title of the loging button to user name.
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImg: CircleImage!
    
    //this for unwind segue and this we could get back all the way to our original vc.
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //this for revealview show all except 60
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        //this for passing image and email to other viewcontroller.
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            //this for changing color num to uicol
            userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
        }
    }
    

}
