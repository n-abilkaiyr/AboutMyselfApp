//
//  ViewController.swift
//  AboutMyselfApp
//
//  Created by Abilkaiyr Nurzhan on 11/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var greetinLabel: UILabel!
   
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetinLabel.text! += "\(user.userName)!"
      
    }


}

