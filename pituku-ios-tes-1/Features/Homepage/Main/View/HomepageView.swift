//
//  HomepageView.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 06/11/23.
//

import Foundation
import SnapKit
import UIKit

protocol HomepageDelegate: AnyObject {
    func didTapButtonGo()
}

final class HomepageView: UIView {
    
    // MARK: - Implementation
    var delegate: HomepageDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.primaryColor
        
        setupView()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 20)
        label.text = "Hi, Ferry Julian!"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.secondaryColor
        
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        label.text = "Please check email to verify!"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.secondaryColor
        
        return label
    }()
    
    private lazy var resendButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 12)
        btn.backgroundColor = UIColor.secondaryColor
        btn.titleLabel?.textColor = UIColor.primaryColor
        btn.setTitle("Resend", for: .normal)
        btn.setTitleColor(UIColor.primaryColor, for: .normal)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(actionBtnResendDidTap), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var characterImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "character1")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    private lazy var containerView: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.lightGray
        container.layer.cornerRadius = 30
        
        return container
    }()
    
    private lazy var containerCollectionView: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.secondaryColor
        container.layer.cornerRadius = 30
        
        return container
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Medium", size: 14)
        label.text = "Pituku services"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var containerInquiry: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.lightGray
        container.layer.cornerRadius = 20
        
        return container
    }()
    
    private lazy var labelInquiry: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 10)
        label.text = """
Inquiry
Request
"""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var imgInquiry: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "handshake")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var groupedInquiryView: UIView = {
        let groupedInfoView: UIStackView = UIStackView(arrangedSubviews: [imgInquiry,
                                                                          labelInquiry,])
        groupedInfoView.axis = .vertical
        groupedInfoView.spacing = 24.0
        groupedInfoView.setCustomSpacing(24.0, after: imgInquiry)
        groupedInfoView.alignment = .leading
        return groupedInfoView
    }()
    
    private lazy var containerDelivery: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.lightGray
        container.layer.cornerRadius = 20
        
        return container
    }()
    
    private lazy var labelDelivery: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 10)
        label.text = """
Pickup
Request
"""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var imgDelivery: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "delivery")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var groupedDeliveryView: UIView = {
        let groupedInfoView: UIStackView = UIStackView(arrangedSubviews: [imgDelivery,
                                                                          labelDelivery,])
        groupedInfoView.axis = .vertical
        groupedInfoView.spacing = 24.0
        groupedInfoView.setCustomSpacing(24.0, after: imgDelivery)
        groupedInfoView.alignment = .leading
        return groupedInfoView
    }()
    
    private lazy var containerReport: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.lightGray
        container.layer.cornerRadius = 20
        
        return container
    }()
    
    private lazy var labelReport: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 10)
        label.text = """
All
Report
"""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var imgReport: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "folder")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var groupedReportView: UIView = {
        let groupedInfoView: UIStackView = UIStackView(arrangedSubviews: [imgReport,
                                                                          labelReport,])
        groupedInfoView.axis = .vertical
        groupedInfoView.spacing = 24.0
        groupedInfoView.setCustomSpacing(26.0, after: imgReport)
        groupedInfoView.alignment = .leading
        return groupedInfoView
    }()
    
    private lazy var containerSupport: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.lightGray
        container.layer.cornerRadius = 20
        
        return container
    }()
    
    private lazy var labelSupport: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 10)
        label.text = """
Client
Support
"""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var imgSupport: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chatBox")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var groupedSupportView: UIView = {
        let groupedInfoView: UIStackView = UIStackView(arrangedSubviews: [imgSupport,
                                                                          labelSupport,])
        groupedInfoView.axis = .vertical
        groupedInfoView.spacing = 24.0
        groupedInfoView.setCustomSpacing(24.0, after: imgSupport)
        groupedInfoView.alignment = .leading
        return groupedInfoView
    }()
    
    private lazy var howHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Medium", size: 14)
        label.text = "How Pituku works?"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var containerHowToWork: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.blue
        container.layer.cornerRadius = 30
        
        return container
    }()
    
    private lazy var titleLabelContentHowToWork: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 20)
        label.text = "Lorem ipsum"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.secondaryColor
        
        return label
    }()
    
    private lazy var descLabelContentHowToWork: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        label.text = """
Lorem ipsum dolor sit
amet consectetur.
"""
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.secondaryColor
        
        return label
    }()
    
    private lazy var characterViewHowToWork: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "character2")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var imageViewEllipseHowToWork: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blueEllipse")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var goButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 12)
        btn.backgroundColor = UIColor.secondaryColor
        btn.titleLabel?.textColor = UIColor.blue
        btn.setTitle("Let’s Go", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(actionBtnGoDidTap), for: .touchUpInside)
        
        return btn
    }()
}

// MARK: - View Creation & Bindings
private extension HomepageView {
    @objc func actionBtnResendDidTap(_ sender: UIButton) {
        print("Resend email")
        
        
    }
    
    @objc func actionBtnGoDidTap(_ sender: UIButton) {
        print("Move Controller")
        delegate?.didTapButtonGo()
//        if let window = self.window {
//            window.rootViewController?.present(InquiryParentViewController(), animated: true, completion: nil)
//        }
        
    }
    
    private func setupView() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(90)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        addSubview(resendButton)
        resendButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(300)
        }
        
        addSubview(characterImageView)
        characterImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.trailing.equalToSuperview().inset(60)
        }
        
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalTo(characterImageView.snp.bottom).inset(10)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        addSubview(containerCollectionView)
        containerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(characterImageView.snp.bottom).inset(10)
            make.bottom.equalToSuperview().inset(90)
            make.leading.trailing.equalToSuperview()
        }
        
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(containerCollectionView.snp.top).offset(220)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        addSubview(containerInquiry)
        containerInquiry.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(300)
            make.bottom.equalTo(containerCollectionView.snp.bottom).inset(240)
        }
        
        addSubview(groupedInquiryView)
        groupedInquiryView.snp.makeConstraints { make in
            make.top.equalTo(containerInquiry.snp.top).offset(15)
            make.leading.trailing.equalToSuperview().inset(36)
        }
        
        addSubview(containerDelivery)
        containerDelivery.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(112)
            make.trailing.equalToSuperview().inset(206)
            make.bottom.equalTo(containerCollectionView.snp.bottom).inset(240)
        }
        
        addSubview(groupedDeliveryView)
        groupedDeliveryView.snp.makeConstraints { make in
            make.top.equalTo(containerDelivery.snp.top).offset(15)
            make.leading.trailing.equalToSuperview().inset(130)
        }
        
        addSubview(containerReport)
        containerReport.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(206)
            make.trailing.equalToSuperview().inset(112)
            make.bottom.equalTo(containerCollectionView.snp.bottom).inset(240)
        }
        
        addSubview(groupedReportView)
        groupedReportView.snp.makeConstraints { make in
            make.top.equalTo(containerReport.snp.top).offset(20)
            make.trailing.equalToSuperview().inset(133)
        }
        
        addSubview(containerSupport)
        containerSupport.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(300)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(containerCollectionView.snp.bottom).inset(240)
        }
        
        addSubview(groupedSupportView)
        groupedSupportView.snp.makeConstraints { make in
            make.top.equalTo(containerSupport.snp.top).offset(15)
            make.trailing.equalToSuperview().inset(36)
        }
        
        addSubview(howHeaderLabel)
        howHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(groupedInquiryView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        addSubview(containerHowToWork)
        containerHowToWork.snp.makeConstraints { make in
            make.top.equalTo(howHeaderLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        addSubview(imageViewEllipseHowToWork)
        imageViewEllipseHowToWork.snp.makeConstraints { make in
            make.top.equalTo(containerHowToWork.snp.top).inset(25)
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(containerHowToWork.snp.bottom)
        }
        
        addSubview(characterViewHowToWork)
        characterViewHowToWork.snp.makeConstraints { make in
            make.top.equalTo(containerHowToWork.snp.top).inset(9)
            make.leading.equalToSuperview().inset(35)
            make.bottom.equalTo(containerHowToWork.snp.bottom)
        }
        
        addSubview(titleLabelContentHowToWork)
        titleLabelContentHowToWork.snp.makeConstraints { make in
            make.top.equalTo(containerHowToWork.snp.top).offset(25)
            make.trailing.equalToSuperview().inset(78)
        }
        
        addSubview(descLabelContentHowToWork)
        descLabelContentHowToWork.snp.makeConstraints { make in
            make.top.equalTo(titleLabelContentHowToWork.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(60)
        }
        
        addSubview(goButton)
        goButton.snp.makeConstraints { make in
            make.top.equalTo(descLabelContentHowToWork.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(195)
            make.trailing.equalToSuperview().inset(130)
        }
        
    }
}
