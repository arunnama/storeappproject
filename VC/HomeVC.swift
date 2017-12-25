//
//  ViewController.swift
//  SleepMe
//
//  Created by Arun Kumar Nama on 15/12/17.
//  Copyright © 2017 Arun Kumar Nama. All rights reserved.
//

import UIKit
import SwiftySound

class HomeVC: UIViewController {

    var mainPulse : LFTPulseAnimation?;
    var innerPulse : LFTPulseAnimation?;
    var isSoundOn : Bool = false;
    private var bgMusic: Sound?
    override func loadView(){
        super.loadView()
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPulse()
        view.layer.addSublayer(mainPulse!)
        view.layer.addSublayer(innerPulse!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerGestures()
        loadMusic()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadMusic()
    {
        if let musicUrl = Bundle.main.url(forResource: "Go_to_Sleep_My_Little_One", withExtension: "mp3") {
            bgMusic = Sound(url: musicUrl)
        }
        
        //  Sound.play(file: "Go_to_Sleep_My_Little_One", fileExtension: "mp3", numberOfLoops: -1) = true;
        isSoundOn = true;
        bgMusic?.play()
        
    }
    func loadPulse()
    {
        mainPulse = LFTPulseAnimation(radius: self.view.frame.width/2, position:self.view.center)
        mainPulse?.animationDuration = 4.0
        
        innerPulse = LFTPulseAnimation(radius: self.view.frame.width/3, position:self.view.center)
        innerPulse?.animationDuration = 4.0
        
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
        let settingsVC:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsVC") as UIViewController
        //self.present(viewController, animated: false, completion: nil)
        navigationController?.pushViewController(settingsVC, animated: true)
 
    }
    
    func initializeGestureRecognizer(actionView:UIView)
    {
        //Tap Gesture
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("recognizeTapGesture:"))
        self.view.addGestureRecognizer(tapGesture)
        //Long Press Gesture
        var longPressedGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: Selector(("recognizeLongPressedGesture:")))
        actionView.addGestureRecognizer(longPressedGesture)
        //Rotate Gesture
        let rotateGesture: UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: Selector("recognizeRotateGesture:"))
        actionView.addGestureRecognizer(rotateGesture)
        //Pinch Gesture
        let pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: Selector(("recognizePinchGesture:")))
        actionView.addGestureRecognizer(pinchGesture)
        //Pan Gesture
        let panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("recognizePanGesture:"))
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        actionView.addGestureRecognizer(panGesture)
        
    }
    

}


