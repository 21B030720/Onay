//
//  DriverVC.swift
//  Onay
//
//  Created by Arslan Toimbekov on 21.12.2023.
//

import UIKit

class DriverVC: UIViewController {

    var driverView: DriverView = DriverView()
    
    override func loadView() {
        driverView.viewController = self
        view = driverView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
