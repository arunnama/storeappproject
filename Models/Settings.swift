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

enum Themes {
    case BeachNight
    case Green
    case MoonLight
    case Default
}

final class Settings
{
    static let sharedInstance = Settings()
    var bgColour : UIColor;
    var bgMusic:String
    var pulseSettings : LFTPulseAnimation?
    var outerCircleColor : UIColor
    var innerCircleColor : UIColor
    var theme:Themes;
    private init(){
        bgColour = UIColor.flatGreenDark
        bgMusic = AppData.musicTypes(name:nil);
        theme = .Default;
        outerCircleColor = UIColor.flatBlack
        innerCircleColor = UIColor.gray
    }

    func themes(theme:Themes)
    {
        switch theme {
        case .BeachNight:
            bgColour = UIColor.flatGreenDark;
            bgMusic = AppData.musicTypes(name: "Green");
            break
        case .Default:
            bgColour = UIColor.flatGreenDark;
            bgMusic = AppData.musicTypes(name: "Green");
            break
        case .Green:
            bgColour = UIColor.flatGreenDark;
            bgMusic = AppData.musicTypes(name: "Green");
            break
        case .MoonLight:
            bgColour = UIColor.flatGreenDark;
            bgMusic = AppData.musicTypes(name: "Green");
            break
        }
    }
}

