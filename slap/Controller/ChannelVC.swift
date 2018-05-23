//
//  ChannelVC.swift
//  slap
//
//  Created by Araz Sinjary on 5/23/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //this for revealview show all except 60
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

    

}
