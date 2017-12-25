//
//  ColorPickerVC.swift
//  SleepMe
//
//  Created by Arun Kumar Nama on 16/12/17.
//  Copyright © 2017 Arun Kumar Nama. All rights reserved.
//

import UIKit
import ChromaColorPicker

class ColorPickerVC: UIViewController,ChromaColorPickerDelegate{

    @IBOutlet weak var colorPic: UIView!
   
    override func viewDidLoad() {
       
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated);
         addColorPicker()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func addColorPicker()
    {
        
        let ColorPicker = ChromaColorPicker(frame:colorPic.frame)
        print(ColorPicker.center)
        ColorPicker.delegate = self
        //ChromaColorPickerDelegate
        ColorPicker.padding = 5
        ColorPicker.stroke = 3
        ColorPicker.hexLabel.textColor = UIColor.white
        
        colorPic.addSubview(ColorPicker)
    }
    
    func colorPickerDidChooseColor(_ colorPicker: ChromaColorPicker, color: UIColor){
        
        self.view.backgroundColor = color;
        
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
