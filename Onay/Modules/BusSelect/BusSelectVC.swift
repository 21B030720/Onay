//
//  BusSelectVC.swift
//  Onay
//
//  Created by Arslan Toimbekov on 21.12.2023.
//

import UIKit


class BusSelectVC: UIViewController {
    
    var filteredList: [String] = ["101", "53", "43", "50", "12", "14", "45"]
    var list: [String] = ["101", "53", "43", "50", "12", "14", "45"]
    
    var busView: BusSelectView = BusSelectView(frame: UIScreen.main.bounds)
    
    override func loadView() {
        busView.viewController = self
        view = busView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        busView.setupUI()
        title = "Busses"
    }

}


extension BusSelectVC: UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            print("Filrtered by", textView.text!)
            filteredList = list.filter {
                $0.contains(textView.text!)
            }
            busView.table.reloadData()
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
        var refreshAlert = UIAlertController(title: "Successful", message: "Request is sent", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
          }))

        present(refreshAlert, animated: true, completion: nil)
    }
    
}
