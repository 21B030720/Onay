//
//  DriverView.swift
//  Onay
//
//  Created by Arslan Toimbekov on 21.12.2023.
//

import UIKit
import MapKit

class DriverView: UIView {

    weak var viewController: DriverVC!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
    }

}
