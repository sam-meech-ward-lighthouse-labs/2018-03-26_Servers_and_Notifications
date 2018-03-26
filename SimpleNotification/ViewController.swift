//
//  ViewController.swift
//  SimpleNotification
//
//  Created by Sam Meech-Ward on 2018-03-26.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
      if granted {
        print("granted")
        
        let content = UNMutableNotificationContent()
        content.title = "Your MOM"
        content.body = "Your mom remembered a tyhing you did and is dissappointed"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Alert", content: content, trigger: trigger)
        center.add(request, withCompletionHandler: { error in
          if let _ = error {
            print("ERror with notification")
          } else {
            print("🤗")
          }
        })
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

