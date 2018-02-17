//
//  SettingsVC.swift
//  SleepMe
//
//  Created by Arun Kumar Nama on 15/12/17.
//  Copyright © 2017 Arun Kumar Nama. All rights reserved.
//

import UIKit
import ChromaColorPicker


class SettingsVC: UITableViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.flatBlue;
        tableView.tableFooterView = UIView();
        tableView.backgroundColor = UIColor.flatGreenDark;
    }
    
    @objc func goHomePage(){
        navigationController?.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         cell.backgroundColor = UIColor.flatCoffee;
    }
    
}
