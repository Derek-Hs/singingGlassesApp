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
    
    @IBAction func gesture1action(sender: UIPanGestureRecognizer) {
        audioController.active = true
        //ml1.text = ""
    }

    //@IBOutlet strong var view: UIView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func slider1action(sender: UISlider) {
        var ml = Double(sender.value*200)
        ml1.text = String(Int(ml)) + " mL"
        //hz1.text = String(Int((value*899)+1216)) + " Hz"
        var r: Double = 3
        var cm: Double = ml / (M_PI * r * r)
        var freq = 0.94088 * pow(cm,4) - 16.1769 * pow(cm,3) + 54.6774 * pow(cm,2) - 45.3039 * cm + 2116.8
        hz1.text = String(Int(freq)) + " Hz"
        PdBase.sendFloat(Float(freq), toReceiver: "r slider")
    }
    
}

