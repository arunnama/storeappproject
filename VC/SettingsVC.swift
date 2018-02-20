//
//  SettingsVC.swift
//  SleepMe
//
//  Created by Arun Kumar Nama on 15/12/17.
//  Copyright © 2017 Arun Kumar Nama. All rights reserved.
//

import UIKit
import ChromaColorPicker
let BG_COLOR_SEGUE = "gbColorSegue"
let CIRCLE_COLOR_SEGUE = "circleColorSegue"

class SettingsVC: UITableViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Settings.sharedInstance.bgColour
        tableView.tableFooterView = UIView();
        let cancelButton = UIBarButtonItem(title: "Cancel", style:.plain, target: self, action:#selector(goHomePage))
        navigationItem.rightBarButtonItem = cancelButton
    }
    
    @objc func goHomePage(){
        navigationController?.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.contentView.backgroundColor = UIColor.clear
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == CIRCLE_COLOR_SEGUE)
        {
            let bgColorVC :ColorPickerVC  = segue.destination as! ColorPickerVC
            bgColorVC.colorSelector = .circleColor
        }
        else if(segue.identifier == BG_COLOR_SEGUE)
        {
            let bgColorVC :ColorPickerVC  = segue.destination as! ColorPickerVC
            bgColorVC.colorSelector = .circleColor
        }
    }
    
}
