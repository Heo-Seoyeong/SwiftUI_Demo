//
//  UserDefaultValue.swift
//  SYSwiftUITodo
//
//  Created by Seoyeong Heo on 2019/06/12.
//  Copyright © 2019 SYSwiftUITodo. All rights reserved.
//

import Foundation

@propertyDelegate
struct UserDefaultValue<Value: Codable> {
    
    let key: String
    let defaultValue: Value
    
    var value: Value {
        get {
            let data = UserDefaults.standard.data(forKey: key)
            let value = data.flatMap { try? JSONDecoder().decode(Value.self, from: $0) }
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }

}
