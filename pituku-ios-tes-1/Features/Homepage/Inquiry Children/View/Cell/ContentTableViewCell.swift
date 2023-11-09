//
//  ContentTableViewCell.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 09/11/23.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let identifier = "ContentTableViewCell"
    
    private lazy var toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.onTintColor = UIColor.primaryColor
        toggle.isOn = false
        
        return toggle
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 14)
        label.text = "Content"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 12)
        label.text = "code"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.gray
        
        return label
    }()
    
    // MARK: - Implementation
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.secondaryColor
        contentView.addSubview(toggle)
        contentView.addSubview(nameLabel)
        contentView.addSubview(codeLabel)
                
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String, codeID: String) {
        nameLabel.text = text
        codeLabel.text = codeID
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        codeLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height-6
        let toggleSize = toggle.sizeThatFits(contentView.frame.size)
        
        toggle.frame = CGRect(x: 5,
                              y: (contentView.frame.size.height-toggleSize.height)/2,
                              width: toggleSize.width,
                              height: toggleSize.height)
        
        nameLabel.frame = CGRect(x: 20+toggle.frame.size.width,
                                 y: 0,
                                 width: contentView.frame.size.width - 10 - toggle.frame.size.width - imageSize,
                                 height: contentView.frame.size.height)
        
        codeLabel.frame = CGRect(x: contentView.frame.size.width-imageSize, 
                                 y: 3,
                                 width: imageSize,
                                 height: imageSize)
        
    }
    
}
