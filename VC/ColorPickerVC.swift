//
//  ColorPickerVC.swift
//  SleepMe
//
//  Created by Arun Kumar Nama on 16/12/17.
//  Copyright © 2017 Arun Kumar Nama. All rights reserved.
//

import UIKit
import ChromaColorPicker
import IGColorPicker


class ColorPickerVC: UIViewController, ColorPickerViewDelegate, ColorPickerViewDelegateFlowLayout{

    @IBOutlet weak var colorPickerView: ColorPickerView!
    @IBOutlet weak var colorPic: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPic.backgroundColor = UIColor.red
        colorPickerView.delegate = self
        colorPickerView.layoutDelegate = self
        colorPickerView.style = .circle
        colorPickerView.selectionStyle = .check
        colorPickerView.isSelectedColorTappable = false
        colorPickerView.preselectedIndex = colorPickerView.colors.indices.first
        
        view.backgroundColor = colorPickerView.colors.first
    }

    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated);
         self.navigationController?.isNavigationBarHidden = false;
        // addColorPicker()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ColorPickerViewDelegate
    
    func colorPickerView(_ colorPickerView: ColorPickerView, didSelectItemAt indexPath: IndexPath) {
       // self.selectedColorView.backgroundColor = colorPickerView.colors[indexPath.item]
        self.view.backgroundColor = colorPickerView.colors[indexPath.item]
        Settings.sharedInstance.bgColour = colorPickerView.colors[indexPath.item]
       // navigationController?.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - ColorPickerViewDelegateFlowLayout
    
    func colorPickerView(_ colorPickerView: ColorPickerView, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 48, height: 48)
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

}
