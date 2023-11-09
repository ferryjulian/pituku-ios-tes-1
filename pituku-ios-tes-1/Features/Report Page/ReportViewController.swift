//
//  ReportViewController.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 07/11/23.
//

import UIKit

class ReportViewController: UIViewController {
    
    private lazy var mainButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 12)
        btn.backgroundColor = UIColor.lightGray
        btn.titleLabel?.textColor = UIColor.primaryColor
        btn.setTitle("Report View", for: .normal)
        btn.setTitleColor(UIColor.primaryColor, for: .normal)
        
        return btn
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.lightGray
        
        mainButton.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        mainButton.center = view.center
        view.addSubview(mainButton)

    }
}
