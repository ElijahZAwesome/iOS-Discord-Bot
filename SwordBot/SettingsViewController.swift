//
//  SettingsViewController.swift
//  SwordBot
//
//  Created by Elijah on 9/12/18.
//  Copyright © 2018 Elijah. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tokenField: UITextField!
    @IBOutlet weak var musicSwitch: UISwitch!
    @IBOutlet weak var notificationsSwitch: UISwitch!
    @IBOutlet weak var chatLogSwitch: UISwitch!
    @IBOutlet weak var autoStartSwitch: UISwitch!
    @IBOutlet weak var showTokenSwitch: UISwitch!
    @IBOutlet weak var prefixField: UITextField!
    
    let defaults = UserDefaults.standard
    
    @IBAction func toggleMusic(_ sender: UISwitch) {
        Settings.musicOn = sender.isOn
        defaults.set(sender.isOn, forKey: "musicOn")
    }
    
    @IBAction func toggleNotifications(_ sender: UISwitch) {
        Settings.notificationsOn = sender.isOn
        defaults.set(sender.isOn, forKey: "notificationsOn")
    }
    
    @IBAction func toggleChatLog(_ sender: UISwitch) {
        Settings.chatLog = sender.isOn
        defaults.set(sender.isOn, forKey: "chatOn")
    }
    
    @IBAction func toggleAutoStart(_ sender: UISwitch) {
        Settings.autoStart = sender.isOn
        defaults.set(sender.isOn, forKey: "autoStartOn")
    }
    
    @IBAction func toggleTokenShow(_ sender: UISwitch) {
        if sender.isOn == true {
            Settings.showToken = true
            tokenField.isHidden = false
        } else {
            Settings.showToken = false
            tokenField.isHidden = true
        }
    }
    
    @IBAction func tokenChange(_ sender: UITextField) {
        Settings.token = sender.text!
        defaults.set(Settings.token, forKey: "token")
    }
    
    @IBAction func prefixChange(_ sender: UITextField) {
        if sender.tag == 0 {
            return
        }
        Settings.prefix = sender.text!
        defaults.set(Settings.prefix, forKey: "prefix")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var musicBool = defaults.object(forKey:"musicOn") as? Bool
        var notificationsBool = defaults.object(forKey:"notificationsOn") as? Bool
        var chatLogBool = defaults.object(forKey:"chatOn") as? Bool
        var autoStartBool = defaults.object(forKey:"autoStartOn") as? Bool
        if musicBool == nil {
            musicBool = musicSwitch.isOn
        }
        if notificationsBool == nil {
            notificationsBool = notificationsSwitch.isOn
        }
        if chatLogBool == nil {
            chatLogBool = chatLogSwitch.isOn
        }
        if autoStartBool == nil {
            autoStartBool = autoStartSwitch.isOn
        }
        musicSwitch.setOn(musicBool!, animated: false)
        notificationsSwitch.setOn(notificationsBool!, animated: false)
        chatLogSwitch.setOn(chatLogBool!, animated: false)
        autoStartSwitch.setOn(autoStartBool!, animated: false)
        showTokenSwitch.setOn(Settings.showToken, animated: false)
        Settings.musicOn = musicBool!
        Settings.notificationsOn = notificationsBool!
        Settings.chatLog = chatLogBool!
        Settings.autoStart = autoStartBool!
        
        if(Settings.showToken == true) {
            tokenField.isHidden = false
        } else {
            tokenField.isHidden = true
        }
        
        tokenField.text = Settings.token
        prefixField.text = Settings.prefix
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupHideKeyboardOnTap()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
