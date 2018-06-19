//
//  CircleImage.swift
//  slap
//
//  Created by Araz Sinjary on 6/19/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import Foundation

@IBDesignable
class CircleImage: UIImageView {
   
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    
}
