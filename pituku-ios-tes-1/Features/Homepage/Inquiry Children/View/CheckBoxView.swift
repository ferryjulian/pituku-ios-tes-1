//
//  CheckBoxView.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 09/11/23.
//

import UIKit

class CheckBoxView: UIView {
    
    //MARK: - Properties
    var isChecked = false
    
    private lazy var checkImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.tintColor = UIColor.secondaryColor
        img.image = UIImage(systemName: "checkmark")
        img.clipsToBounds = true
        img.isHidden = true
        
        return img
    }()
    
    private lazy var boxView: UIView = {
        let img = UIView()
        img.layer.borderWidth = 1
        
        return img
    }()

    // MARK: - Implementation
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.primaryColor
        
        setupView()
                        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraints()
    }
    
    public func checkBox() {
        self.isChecked = !isChecked
        
        checkImageView.isHidden = !isChecked
    }
}

// MARK: - View Creation & Bindings
private extension CheckBoxView {
    
    private func setupView() {
        addSubview(boxView)
        addSubview(checkImageView)
    }
    
    private func setupConstraints() {
        boxView.frame = CGRect(x: 7, y: 7, width: frame.size.width - 14, height: frame.size.height - 14)
        checkImageView.frame = bounds

//        checkImageView.snp.makeConstraints { make in
//            make.top.bottom.equalToSuperview().inset(16)
//            make.leading.trailing.equalToSuperview().inset(16)
//        }
    }
}
