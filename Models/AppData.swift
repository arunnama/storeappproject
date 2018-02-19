//
//  AppData.swift
//  SleepMe
//
//  Created by Arun Kumar Nama on 15/12/17.
//  Copyright © 2017 Arun Kumar Nama. All rights reserved.
//

import Foundation

let audioFiles:Array = ["Go_to_Sleep_My_Little_One.mp3","Meditation_Impromptu_02.mp3","Nevada_City.mp3"];

class AppData{
    
    static func musicTypes(name:String?)->String{
        let dictionary: [String:String] = [
            "Green" : "green.mp3",
            "Coffee" : "coffee.mp3",
            "BeachNight" : "beach.mp3"
        ]
        guard let selectedTheme = name else {return "Default.mp3"}
        return dictionary[selectedTheme]!;
    }
}
