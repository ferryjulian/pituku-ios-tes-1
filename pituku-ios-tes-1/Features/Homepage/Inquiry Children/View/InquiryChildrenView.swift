//
//  InquiryChildrenView.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 08/11/23.
//

import UIKit
import SnapKit

class InquiryChildrenView: UIView {

    // MARK: - Implementation
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.secondaryColor
        
        setupView()
                
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 22)
        label.text = "Waste Type"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        label.text = "Select the type of waste from your company that you want to be picked-up and processed"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.gray
        
        return label
    }()
    
    private lazy var firstButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 12)
        btn.backgroundColor = UIColor.primaryColor
        btn.titleLabel?.textColor = UIColor.secondaryColor
        btn.setTitle("B3 Waste", for: .normal)
        btn.setTitleColor(UIColor.secondaryColor, for: .normal)
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(actionBtnDidTap), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var secondButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 12)
        btn.backgroundColor = UIColor.secondaryColor
        btn.titleLabel?.textColor = UIColor.primaryColor
        btn.setTitle("Non-B3 Waste", for: .normal)
        btn.setTitleColor(UIColor.primaryColor, for: .normal)
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(actionBtnDidTap), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.searchBarStyle = UISearchBar.Style.minimal
        search.placeholder = "Search waste name or code"

        return search
    }()
    
    private lazy var nextButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 12)
        btn.backgroundColor = UIColor.primaryColor
        btn.titleLabel?.textColor = UIColor.secondaryColor
        btn.setTitle("Next", for: .normal)
        btn.setTitleColor(UIColor.secondaryColor, for: .normal)
        btn.layer.cornerRadius = 20
        btn.addTarget(self, action: #selector(actionBtnNextDidTap), for: .touchUpInside)
        
        return btn
    }()

}

// MARK: - View Creation & Bindings
private extension InquiryChildrenView {
    
    @objc func actionBtnDidTap(_ sender: UIButton) {
        print("Choosing")
        
    }
    
    @objc func actionBtnNextDidTap(_ sender: UIButton) {
        print("Next button")
        
    }
    
    private func setupView() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        addSubview(firstButton)
        firstButton.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(200)
        }
        
        addSubview(secondButton)
        secondButton.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(200)
            make.trailing.equalToSuperview().inset(16)
        }
        
        addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(firstButton.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(770)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(40)
        }
    }
}
