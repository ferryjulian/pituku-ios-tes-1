//
//  HomepageViewController.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 06/11/23.
//

import UIKit
import SnapKit

final class HomepageViewController: UIViewController, HomepageDelegate {
    
    // MARK: - Properties
    private lazy var thisView: HomepageView = HomepageView()
    
    private lazy var collectionViewAds: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.layer.cornerRadius = 35
        collection.register(AdsCollectionViewCell.self, forCellWithReuseIdentifier: AdsCollectionViewCell.identifier)
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    //MARK: - Implementation
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.primaryColor
        view = thisView
        
        bindDelegate()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: - Setup UI CollectionView
    private func setupCollectionView() {
        view.addSubview(collectionViewAds)
        collectionViewAds.reloadData()
        
        collectionViewAds.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(230)
            make.bottom.equalToSuperview().inset(450)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
    }
    
    func didTapButtonGo() {
        let navVC = UINavigationController(rootViewController: InquiryParentViewController())
        navVC.modalPresentationStyle = .overFullScreen
        self.present(navVC, animated: true, completion: nil)

    }
    
    func bindDelegate() {
        thisView.delegate = self
    }
    
}

//MARK: - Implementation CollectionView
extension HomepageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdsCollectionViewCell.identifier, for: indexPath) as! AdsCollectionViewCell
        switch indexPath.row {
        case 0:
            cell.backgroundColor = UIColor.primaryColor
        case 1:
            cell.backgroundColor = UIColor.gray
        case 2:
            cell.backgroundColor = UIColor.blue
        default:
            cell.backgroundColor = UIColor.primaryColor
        }
        return cell
    }
}

extension HomepageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.frame.size
    }
}

