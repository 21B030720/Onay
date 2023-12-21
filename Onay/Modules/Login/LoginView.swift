//
//  LoginView.swift
//  Onay
//
//  Created by Arslan Toimbekov on 21.12.2023.
//

import UIKit
import SnapKit

class LoginView: UIView {
    let rolesArray = ["passanger", "driver", "map"]
    var role: String! = "role"
    
    lazy var nameTextField: UITextField = {
        let content = UITextField()
        content.backgroundColor = #colorLiteral(red: 0.5955511533, green: 0.9481025338, blue: 0.8467716451, alpha: 1)
        return content
    }()
    
    lazy var IINTextField: UITextField = {
        let content = UITextField()
        content.backgroundColor = #colorLiteral(red: 0.5955511533, green: 0.9481025338, blue: 0.8467716451, alpha: 1)
        return content
    }()
    
    lazy var roleButton: UIButton = {
        let content = UIButton()
        
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.2036997477, green: 0.03813213533, blue: 0.1600830025, alpha: 1)])
        content.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
        content.backgroundColor = .clear
        return content
    }()
    
    lazy var loginButton: UIButton = {
        let content = UIButton()
        content.backgroundColor = #colorLiteral(red: 0.6909781767, green: 0.9602448273, blue: 1, alpha: 1)
        content.addTarget(self, action: #selector(login), for: .touchUpInside)
        content.setTitle("Login", for: .normal)
        return content
    }()
    
    
    weak var viewController: LoginVC!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
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
        
        
        addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((topPadding ?? 0) + (screenHeight / 4))
            make.leading.equalToSuperview().offset(screenWidth / 10)
            make.trailing.equalToSuperview().offset(-(screenWidth / 10))
            make.height.equalTo(screenHeight / 15)
        }
        
        addSubview(IINTextField)
        IINTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(screenHeight / 10)
            make.leading.equalToSuperview().offset(screenWidth / 10)
            make.trailing.equalToSuperview().offset(-(screenWidth / 8))
            make.height.equalTo(screenHeight / 15)
        }
        
        addSubview(roleButton)
        roleButton.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(screenHeight / 10)
            make.leading.equalTo(IINTextField.snp.trailing).offset(10)
            make.width.equalTo(40)
            make.height.equalTo(screenHeight / 15)
        }
        let actionClosure = { (action: UIAction) in
            self.role = action.title
        }
        var menuChildren: [UIMenuElement] = []
        for i in rolesArray {
            menuChildren.append(UIAction(title: i, handler: actionClosure))
        }
        roleButton.menu = UIMenu(options: .displayInline, children: menuChildren)
        roleButton.showsMenuAsPrimaryAction = true
        
        addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(IINTextField.snp.bottom).offset(screenHeight / 8)
            make.leading.equalToSuperview().offset(screenWidth / 8)
            make.trailing.equalToSuperview().offset(-(screenWidth / 8))
            make.height.equalTo(screenHeight / 15)
        }
    }
    
    @objc func login() {
        print("login in view")
        viewController.login(name: nameTextField.text!, iin: IINTextField.text!, role: role)
    }

}
