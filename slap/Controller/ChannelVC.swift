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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //this for revealview show all except 60
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    

}
