//
//  ViewController.swift
//  Onay
//
//  Created by Arslan Toimbekov on 21.12.2023.
//

import UIKit

class LoginVC: UIViewController {
    
    let loginView: LoginView = LoginView()
    
    override func loadView() {
        loginView.viewController = self
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setupUI() {
        
    }
    
    func login(name: String, iin: String, role: String) {
        print("login in vc")
        if role == "passanger" {
            let passangervc = PassengerVC()
            navigationController?.pushViewController(passangervc, animated: true)
        } else if role == "driver" {
            let drivervc = DriverVC()
            navigationController?.pushViewController(drivervc, animated: true)
        } else if role == "map" {
            let map = MapVC()
            navigationController?.pushViewController(map, animated: true)
        }
    }


}

