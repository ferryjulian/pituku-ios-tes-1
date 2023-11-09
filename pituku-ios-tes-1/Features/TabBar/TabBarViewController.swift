//
//  TabBarViewController.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 07/11/23.
//

import UIKit
import SnapKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        self.tabBar.tintColor = UIColor.primaryColor
        self.tabBar.backgroundColor = UIColor.secondaryColor
        self.tabBar.barTintColor = UIColor.gray
        
        //MARK: - Create Instance of VC
        let homeVC = HomepageViewController()
        let walletVC = WalletViewController()
        let reportVC = ReportViewController()
        let profileVC = ProfileViewController()
        
        //MARK: - Set Title
        homeVC.title = "Home"
        walletVC.title = "Wallet"
        reportVC.title = "Report"
        profileVC.title = "Profile"
        
        //MARK: - Assign VC to TabBar
        self.setViewControllers([homeVC, walletVC, reportVC, profileVC], animated: false)
        
        guard let items = self.tabBar.items else { return }
        let images = ["building.2", "creditcard", "pencil.and.outline", "person.fill"]
        
        for x in 0...3 {
            items[x].image = UIImage(systemName: images[x])
        }
    }
}
