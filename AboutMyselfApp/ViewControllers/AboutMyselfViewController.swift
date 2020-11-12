//
//  AboutMyselfViewController.swift
//  AboutMyselfApp
//
//  Created by Abilkaiyr Nurzhan on 11/10/20.
//

import UIKit

class AboutMyselfViewController: UIViewController {

    @IBOutlet var myImage: UIImageView!
    
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var adressLabel: UILabel!
    @IBOutlet var numberFriendsLabel: UILabel!
    @IBOutlet var numberOfFolowersLabel: UILabel!
    @IBOutlet var numberOfPublicationsLabel: UILabel!
    @IBOutlet var biographyLabel: UILabel!
   
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = user.userName
        self.navigationItem.title = user.userName
        myImage.layer.cornerRadius = myImage.bounds.size.height / 2
        myImage.layer.borderWidth = 3
        myImage.layer.borderColor = UIColor.lightGray.cgColor
        fullNameLabel.text = user.fullName
        adressLabel.text! += "\(user.city) in \(user.country)"
        numberFriendsLabel.text = String(user.friends)
        numberOfPublicationsLabel.text = String(user.publications)
        numberOfFolowersLabel.text = String(user.followers)
        biographyLabel.text = user.biography
        
    }
    

}
