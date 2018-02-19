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
import SwiftySound

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
    var bgMusicSound:Sound?
    var bgMusicName:String {
        didSet{
            if let bgMusicSoundUrl = Bundle.main.url(forResource:bgMusicName, withExtension: "") {
                bgMusicSound = Sound(url: bgMusicSoundUrl)
            }
        }
    }
   
    var pulseSettings : LFTPulseAnimation?
    var outerCircleColor : UIColor
    var innerCircleColor : UIColor
    var theme:Themes;
    private init(){
        bgColour = UIColor.flatGreenDark
        bgMusicName = audioFiles[0];
        if let bgMusicSoundUrl = Bundle.main.url(forResource:bgMusicName, withExtension: "") {
            bgMusicSound = Sound(url: bgMusicSoundUrl)
        }
        theme = .Default;
        outerCircleColor = UIColor.flatBlack
        innerCircleColor = UIColor.gray
    }

    func themes(theme:Themes)
    {
        switch theme {
        case .BeachNight:
            bgColour = UIColor.flatGreenDark;
            break
        case .Default:
            bgColour = UIColor.flatGreenDark;
            break
        case .Green:
            bgColour = UIColor.flatGreenDark;
            break
        case .MoonLight:
            bgColour = UIColor.flatGreenDark;
            break
        }
    }
    
    
}

