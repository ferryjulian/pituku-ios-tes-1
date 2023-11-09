//
//  InquiryParentViewController.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 08/11/23.
//

import UIKit

final class InquiryParentViewController: UIViewController, InquiryDelegate {
    
    // MARK: - Properties
    private lazy var thisView: InquiryParentView = InquiryParentView()

    //MARK: - Implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = thisView
        
        self.navigationItem.title = "Create Contact"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(didTapBackButton))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "doc.badge.clock"), style: .plain, target: self, action: nil)
        
        self.navigationController?.navigationBar.tintColor = UIColor.primaryColor
                
        bindDelegate()
        
    }
    
    // MARK: - Func & Delegate
    @objc func didTapButton() {
        let navVC = UINavigationController(rootViewController: InquiryChildrenViewController())
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
    @objc func didTapBackButton() {
        self.view!.window?.rootViewController?.presentedViewController?.dismiss(animated: true)
    }

    
    func bindDelegate() {
        thisView.delegate = self
    }
}
