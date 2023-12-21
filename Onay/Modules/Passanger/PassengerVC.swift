//
//  ClientVC.swift
//  Onay
//
//  Created by Arslan Toimbekov on 21.12.2023.
//

import UIKit

class PassengerVC: UIViewController {
    
    var filteredList: [String] = ["Mamirayeva", "Abay Pravda"]
    var list: [String] = ["Mamirayeva", "Abay Pravda", "Mamirayeva", "Abay Pravda", "Mamirayeva", "Abay Pravda", "Mamirayeva", "Abay Pravda"]
    
    var passangerView: PassengerView = PassengerView(frame: UIScreen.main.bounds)
    
    override func loadView() {
        passangerView.viewController = self
        view = passangerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passangerView.setupUI()
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

extension PassengerVC: UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            print("Filrtered by", textView.text!)
            filteredList = list.filter {
                $0.contains(textView.text!)
            }
            passangerView.table.reloadData()
            return false
        }
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = filteredList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bus = BusSelectVC()
        navigationController?.pushViewController(bus, animated: true)
    }
    
}
