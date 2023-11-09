//
//  AdsCollectionViewCell.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 07/11/23.
//

import UIKit

class AdsCollectionViewCell: UICollectionViewCell {
    static let identifier = "AdsCollectionViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 20)
        label.text = "Lorem ipsum"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.secondaryColor
        
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        label.text = """
Lorem ipsum dolor sit
amet consectetur.
Consequat sed cursus.
"""
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.secondaryColor
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "trashEllipse")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var imageViewEllipse: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "greenEllipse")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.primaryColor
        setupView()
        
//        addSubview(containerView)
//        containerView.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(100)
//            make.bottom.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        addSubview(imageViewEllipse)
        imageViewEllipse.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(5)
        }
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
