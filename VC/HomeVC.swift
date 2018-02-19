//
//  ViewController.swift
//  SleepMe
//
//  Created by Arun Kumar Nama on 15/12/17.
//  Copyright © 2017 Arun Kumar Nama. All rights reserved.
//

import UIKit
import SwiftySound

class HomeVC: UIViewController{
    
    var mainPulse : LFTPulseAnimation?;
    var innerPulse : LFTPulseAnimation?;
    var superInnerPulse : LFTPulseAnimation?;
    var isSoundOn : Bool = false;
    var bgMusic: Sound?
    
    override func loadView(){
        super.loadView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPulse()
        view.backgroundColor = UIColor.flatGreenDark;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTheme();
        view.layer.addSublayer(mainPulse!)
        view.layer.addSublayer(innerPulse!)
        view.layer.addSublayer(superInnerPulse!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerGestures()

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        mainPulse?.removeFromSuperlayer()
        innerPulse?.removeFromSuperlayer()
        superInnerPulse?.removeFromSuperlayer();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playMusic()
    {
        isSoundOn = true;
        bgMusic?.play()
        
    }
    func loadPulse()
    {
        mainPulse = LFTPulseAnimation(radius: self.view.frame.width/2, position:self.view.center)
        mainPulse?.animationDuration = 6.0
        innerPulse = LFTPulseAnimation(radius: self.view.frame.width/3, position:self.view.center)
        innerPulse?.animationDuration = 5.0
        superInnerPulse = LFTPulseAnimation(radius: self.view.frame.width/3, position:self.view.center)
        superInnerPulse?.animationDuration = 5.0
    }
    
    func registerGestures()
    {
        let doubleTap = UITapGestureRecognizer()
        doubleTap.numberOfTapsRequired = 2
        doubleTap.addTarget(self, action: #selector(self.doubleTapHandler))
        self.view.addGestureRecognizer(doubleTap);
        let singleTap = UITapGestureRecognizer()
        singleTap.numberOfTapsRequired = 1
        singleTap.addTarget(self, action: #selector(self.singleTapHandler))
        self.view.addGestureRecognizer(singleTap);
        let swipeRight = UISwipeGestureRecognizer(target: self, action: nil)
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector((volumeDown)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(volumeUp))
        swipeDown.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    @objc func singleTapHandler() {
        if(isSoundOn){
            isSoundOn = false
            bgMusic?.stop();
        }
        else{
            isSoundOn = true;
            bgMusic?.play(numberOfLoops: -1, completion: nil)
        }
    }
    
    @objc func volumeUp()
    {
        bgMusic?.volume +=  ((bgMusic?.volume)! / 100) * 10
    }
    
    @objc func volumeDown()
    {
        bgMusic?.volume -=  ((bgMusic?.volume)! / 100) * 10
    }
    @objc func doubleTapHandler()
    {
        let mainNavController: MainNavigationController  = storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
        self.present(mainNavController, animated: true, completion: nil)
    }
    
    func loadTheme()
    {
        view.backgroundColor = Settings.sharedInstance.bgColour
        bgMusic = Settings.sharedInstance.bgMusicSound
        bgMusic?.stop();
        mainPulse?.setCircleColor(color: Settings.sharedInstance.outerCircleColor)
        innerPulse?.setCircleColor(color: Settings.sharedInstance.innerCircleColor)
        superInnerPulse?.setCircleColor(color: UIColor.flatBlackDark)
        playMusic()
        
    }
}


