//
//  InquiryChildrenViewController.swift
//  pituku-ios-tes-1
//
//  Created by Ferry Julian on 08/11/23.
//

import UIKit
import SnapKit

class InquiryChildrenViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var thisView: InquiryChildrenView = InquiryChildrenView()
    private lazy var categoryList = ["Tetrakloroetilen", "Ksilena", "Amonium hidroksida", "Tetrakloroetilen", "Aseton", "Metilenklorida", "Etil asetat", "Asam hidroklorat", "Asam nitrat", "Karbon tetraklorida", "Kalium hidroksida", "Kontaminasi 83", "Asam belum terkodifikasi", "Metanol", "Karbon aktif" ]
    
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
        dataTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

// MARK: - Functions TableView
extension InquiryChildrenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categoryList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
}
