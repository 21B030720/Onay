//
//  BusSelectView.swift
//  Onay
//
//  Created by Arslan Toimbekov on 21.12.2023.
//

import UIKit

class BusSelectView: UIView {

    lazy var table: UITableView = UITableView()
    lazy var filter: UITextView = UITextView()
    weak var viewController: BusSelectVC!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let window = UIApplication.shared.keyWindow
        let topPadding = window?.safeAreaInsets.top
        let bottomPadding = window?.safeAreaInsets.bottom
        
        addSubview(filter)
        filter.delegate = viewController.self
        filter.autocorrectionType = .no
        filter.autocapitalizationType = .none
        filter.backgroundColor = #colorLiteral(red: 0.5955511533, green: 0.9481025338, blue: 0.8467716451, alpha: 1)
        filter.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((topPadding ?? 0) + 100)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(screenHeight / 15)
        }
        
        addSubview(table)
        
        table.delegate = viewController
        table.dataSource = viewController
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.snp.makeConstraints { make in
            make.top.equalTo(filter.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(screenHeight / 15 * 13)
        }
    }
        

}
