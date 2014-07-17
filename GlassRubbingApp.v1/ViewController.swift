//
//  ViewController.swift
//  GlassRubbingApp.v1
//
//  Created by Cluster 5 on 7/11/14.
//  Copyright (c) 2014 Cluster 5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var glass1: UIButton
    
    @IBOutlet var ml1: UILabel
    @IBOutlet var hz1: UILabel
    
    @IBOutlet var slider1: UISlider
    
    @IBOutlet var gesture1: UIPanGestureRecognizer
    
    var freq: Float = 2007
    
    @IBAction func gesture1action(sender: UIPanGestureRecognizer) {
        // make sure touch is near rim
        var coord = sender.translationInView(self.view)
        if(coord.x<230 && coord.x>(-230) && coord.y<200 && coord.y>(-200)) {
            PdBase.sendFloat(freq, toReceiver: "frequency")
        }
        else {
            PdBase.sendFloat(0, toReceiver: "loudness")
        }
        
        // stop playing when touch is gone
        if(sender.numberOfTouches()==0) {
            println("Should stop now!")
            PdBase.sendFloat(0, toReceiver: "loudness")
        }
        
        // set volume according to speed
        var velocity = sender.velocityInView(self.view)
        //println(velocity)
        var speed = abs(velocity.x) + abs(velocity.y)
        if(speed/3000 > 1) {
            PdBase.sendFloat(1, toReceiver: "loudness")
        }
        else {
            PdBase.sendFloat(Float(speed/3000), toReceiver: "loudness")
        }
        /*if(speed < 150) {
            PdBase.sendFloat(0, toReceiver: "loudness")
        }*/
    }

    @IBAction func slider1action(sender: UISlider) {
        var ml = Double(sender.value*200)
        ml1.text = String(Int(ml)) + " mL"
        var r: Double = 2.8
        var cm: Double = ml / (M_PI * r * r)
        var num = 0.94088 * pow(cm,4) - 16.1769 * pow(cm,3) + 54.6774 * pow(cm,2) - 45.3039 * cm + 2116.8
        hz1.text = String(Int(num)) + " Hz"
        freq = Float(num)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

