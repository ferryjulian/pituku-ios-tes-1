//
//  InquiryChildrenViewController.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 08/11/23.
//

import UIKit
import SnapKit

class InquiryChildrenViewController: UIViewController {
    
    //List name
    private lazy var nameList = ["Tetrakloroetilen", "Ksilena", "Amonium hidroksida", "Tetrakloroetilen", "Aseton", "Metilenklorida", "Etil asetat", "Asam hidroklorat", "Asam nitrat", "Karbon tetraklorida", "Kalium hidroksida", "Kontaminasi 83", "Asam belum terkodifikasi", "Metanol", "Karbon aktif" ]
    
    //List codeID
    private lazy var codeList = ["A101a", "A101b", "A101c", "A102a", "A102b", "A103a", "A103b", "A103c", "A105c", "A106a", "A107c", "A108d", "A109d", "A110b", "A111d" ]
    
    // MARK: - Properties
    private lazy var thisView: InquiryChildrenView = InquiryChildrenView()
    
    private lazy var dataTable: UITableView = {
        let tabel = UITableView()
        tabel.backgroundColor = UIColor.lightGray
        
        return tabel
    }()
    
    // MARK: - Implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = thisView
        setupUI()
        setupTable()
        
        self.navigationItem.title = "Create Contact"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(didTapBackButton))
        
        self.navigationController?.navigationBar.tintColor = UIColor.primaryColor
    }
    
    // MARK: - Func & Delegate
    @objc func didTapBackButton() {
        self.view!.window?.rootViewController?.presentedViewController?.dismiss(animated: true)
    }
    
    // MARK: - Setup UI TableView
    private func setupUI() {
        
        view.addSubview(dataTable)
        dataTable.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(310)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(60)
        }
        
    }
    
    private func setupTable() {
        dataTable.dataSource = self
        dataTable.delegate = self
        dataTable.reloadData()
        dataTable.register(ContentTableViewCell.self, forCellReuseIdentifier: ContentTableViewCell.identifier)
    }
}

// MARK: - Functions TableView
extension InquiryChildrenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentTableViewCell.identifier, for: indexPath) as? ContentTableViewCell else {
            return UITableViewCell()
        }
//        cell.textLabel?.text = categoryList[indexPath.row]
        cell.configure(text: nameList[indexPath.row], codeID: codeList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
}
