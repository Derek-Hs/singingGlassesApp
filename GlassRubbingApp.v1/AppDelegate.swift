//
//  AppDelegate.swift
//  test3
//
//  Created by Cluster 5 on 7/10/14.
//  Copyright (c) 2014 Cluster 5. All rights reserved.
//

import UIKit

let audioController = PdAudioController()

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //     let audioController = PdAudioController()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        // Override point for customization after application launch.
        audioController.configureAmbientWithSampleRate(44100, numberChannels: 2, mixingEnabled: true)
        PdBase.setDelegate(self)
        openAndRunTestPatch()
        audioController.print()
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    func receivePrint(message:NSString)->Void {
        println("(pd) \(message)")
    }
    
    func openAndRunTestPatch()->Void {
        // open patch located in app bundle
        let fileName = "pdfile.pd"
        let bp = NSBundle.mainBundle().bundlePath
        PdBase.openFile(String(fileName), path:bp)
        audioController.active = true
    }
    
    
}
