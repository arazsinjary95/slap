//
//  CreateAccountVC.swift
//  slap
//
//  Created by Araz Sinjary on 5/24/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closePressed(_ sender: Any) {
        
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
   
}
