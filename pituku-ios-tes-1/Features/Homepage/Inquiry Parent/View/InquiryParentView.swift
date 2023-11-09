//
//  InquiryParentView.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 08/11/23.
//

import UIKit
import SnapKit

protocol InquiryDelegate: AnyObject {
    func didTapButton()
}

final class InquiryParentView: UIView {
    
    // MARK: - Implementation
    var delegate: InquiryDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.secondaryColor
                
        setupView()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    private lazy var noDataImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "noData")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        label.text = """
        There is no list of contract.
        Create the contract now!
"""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.gray
        
        return label
    }()
    
    private lazy var createButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 14)
        btn.backgroundColor = UIColor.primaryColor
        btn.titleLabel?.textColor = UIColor.secondaryColor
        btn.setTitle("Create Contact", for: .normal)
        btn.setTitleColor(UIColor.secondaryColor, for: .normal)
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.tintColor = UIColor.secondaryColor
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(actionBtnDidTap), for: .touchUpInside)
        
        return btn
    }()
}

// MARK: - View Creation & Bindings
private extension InquiryParentView {
    
    @objc func actionBtnDidTap(_ sender: UIButton) {
        print("Add contact")
        delegate?.didTapButton()
        
        
    }
    
    private func setupView() {
        addSubview(noDataImageView)
        noDataImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(400)
        }
        
        addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(noDataImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(85)
        }
        
        addSubview(createButton)
        createButton.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(110)
            make.bottom.equalTo(noDataImageView.snp.bottom).offset(110)
        }
    }
}
