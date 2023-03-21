//
//  UserSettings.swift
//  UserSettingsDemo
//
//  Created by Eshan Singh on 17/03/23.
//

import Foundation

final public class UserSettings {
    
    private var settings:[String:Any] = ["Theme":"Vivid","Brightness":50]
    private let serialQueue = DispatchQueue(label: "serialQueue")
    private init() {
        
    }
    
    public static let shared = UserSettings()
    
    public func string(forKey key:String) -> String? {
      //  serialQueue.sync {
            return settings[key] as? String
        //}
    }
    
    public func int(forKey key:String) -> Int? {
        serialQueue.sync {
            return settings[key] as? Int
        }
    }
    
    public func set(forKey key: String , value: Any) {
        serialQueue.sync {
            settings[key] = value
        }
    }
}
