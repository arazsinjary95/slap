//
//  GradientView.swift
//  slap
//
//  Created by Araz Sinjary on 5/23/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit

//this for render inside storyboard
@IBDesignable
class GradientView: UIView {

    //this is first color becuase is a gradient.
    //these variables for able to select and change in the storyboard.
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        
        didSet {
            //this when you change the color here is going to be update.
            self.setNeedsLayout()
        }
    }
    
    //second color
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        
        didSet {
            
            self.setNeedsLayout()
        }
    }
    
    //this for run time after update we going to override it.
    //CA is mean core animation.
    override func layoutSubviews() {
        
        let gradientLayer = CAGradientLayer()
        //setup the array of colors are including this gradient. you can put more than tow color.
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        //then from where to where.
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        //then size.
        gradientLayer.frame = self.bounds
        //here we need to added to anything. we are going to add this gradient layer to the UI views layer. (at) place id at zero meaning that it's at the first layer.
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
