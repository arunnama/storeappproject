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
       
        
        // Do any additional setup after loading the view.
    }
    
    @objc func goHomePage()
    {
        navigationController?.dismiss(animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "circleColor"{
          
            segue.destination.navigationItem.title = "Select your color"
            segue.destination.navigationItem.backBarButtonItem?.title = "Settings"
            segue.destination.navigationItem.hidesBackButton = false;
            
           
        }
        
        if (segue.identifier == "circleColor") {
            var  vc:UIViewController = segue.destination as! ColorPickerVC
            vc.navigationItem.hidesBackButton = false;
        }
        if segue.identifier == "bgMusic"{
            segue.destination.navigationItem.title = "Select your music"
            segue.destination.navigationItem.backBarButtonItem?.title = "Settings"
            segue.destination.navigationItem.hidesBackButton = false;
        }
        
      // segue.destination.navigationItem.backBarButtonItem?.title = "Settings"
      //  segue.destination.navigationController?.navigationBar.isHidden = false;
        
    }
   
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
