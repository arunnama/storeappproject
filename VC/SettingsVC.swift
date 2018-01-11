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
        let backItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(goHomePage))
        navigationItem.rightBarButtonItem = backItem
    }
    
    @objc func goHomePage(){
        navigationController?.dismiss(animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
