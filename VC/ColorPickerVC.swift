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


public enum SegueIdentifiers:String{
    case bgColor,circleColor
}
class ColorPickerVC: UIViewController, ColorPickerViewDelegate, ColorPickerViewDelegateFlowLayout{

    var colorSelector: SegueIdentifiers = .bgColor
    
    @IBOutlet var colorPickerView: ColorPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Settings.sharedInstance.bgColour
        colorPickerView.delegate = self
        colorPickerView.layoutDelegate = self
        colorPickerView.style = .square
        colorPickerView.selectionStyle = .check
        colorPickerView.isSelectedColorTappable = false
        colorPickerView.preselectedIndex = colorPickerView.colors.indices.first
        navigationController?.navigationItem.title = "Colors"
    }

    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated);
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
        if(colorSelector == .bgColor){
            Settings.sharedInstance.bgColour = colorPickerView.colors[indexPath.item]
        }
        else
        {
            Settings.sharedInstance.outerCircleColor = colorPickerView.colors[indexPath.item]
        }
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
