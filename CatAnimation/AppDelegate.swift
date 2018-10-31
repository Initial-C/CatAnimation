//
//  AppDelegate.swift
//  CatAnimation
//
//  Created by InitialC on 2018/10/12.
//  Copyright © 2018年 InitialC. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    fileprivate var tempPlayer : AVPlayer?
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupInitialVoice()
        return true
    }
    
    func setupInitialVoice() {
        let session = AVAudioSession.sharedInstance()
        let tempMp3 = Bundle.main.path(forResource: "mia", ofType: ".mp3")
        do {
            try session.setCategory(.playback, mode: .default, options: .allowAirPlay)
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {}
        //
        let tempItem = AVPlayerItem.init(asset: AVAsset.init(url: URL.init(fileURLWithPath: tempMp3 ?? "")))
        tempPlayer = AVPlayer.init(playerItem: tempItem)
        tempPlayer?.seek(to: CMTime.zero)
        tempPlayer?.play()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

