//
//  UserDefaultValue.swift
//  Money
//
//  Created by Mac on 2023/4/22.
//

import Foundation

struct UserDefaultValue<Value: Codable> {
    let key: String
    let defaultValue: Value
    
    var value: Value {
        get {
            let data = UserDefaults.standard.data(forKey: key)
            let value = data.flatMap{ try? JSONDecoder().decode(Value.self, from: $0) }
            return value ?? defaultValue
        }
        
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
