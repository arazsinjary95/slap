//
//  AvatarPickerVC.swift
//  slap
//
//  Created by Araz Sinjary on 6/17/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //outlets
    @IBOutlet weak var collectionVeiw: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    //variables
    var avatarType = AvatarType.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionVeiw.delegate = self
        collectionVeiw.dataSource = self
        
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        return AvatarCell()    //UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark {
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }
        else {
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil) //back to createAcaoutnVC
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0 {
            avatarType = .dark
        }
        else  {
            avatarType = .light
        }
        //reload data is important
        collectionVeiw.reloadData()
    }
    
    //this func is for sizing collectionview for different size screen
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numOfColumns: CGFloat = 3
        if UIScreen.main.bounds.width > 320 {
            numOfColumns = 4
        }
        
        let spaceBetweenCells: CGFloat = 10
        let padding: CGFloat = 40 //both side
        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells) / numOfColumns
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    
    
    
    
    
    
}
