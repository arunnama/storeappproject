//
//  File.swift
//  SleepMe
//
//  Created by Arun Kumar Nama on 15/12/17.
//  Copyright © 2017 Arun Kumar Nama. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import ChameleonFramework

final class Settings
{
    static let sharedInstance = Settings()
    var bgColour : UIColor = FlatSkyBlueDark()
    var bgMusic:String = AppData.musicTypes()[0]
    var pulseSettings : LFTPulseAnimation?
    
    private init(){}
    
}
