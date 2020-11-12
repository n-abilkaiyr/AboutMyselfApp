//
//  TabBarViewController .swift
//  AboutMyselfApp
//
//  Created by Abilkaiyr Nurzhan on 11/11/20.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var user: User! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewControllers = viewControllers else { return }
        
        for viewController in viewControllers {
            
            if let mainVC = viewController as? ViewController {
                mainVC.user = user
            } else if let navVC =  viewController as? UINavigationController {
                if let aboutMyselfVC = navVC.viewControllers.first as? AboutMyselfViewController {
                    aboutMyselfVC.user = user
                }
            }
            
        }
    
    }
}
