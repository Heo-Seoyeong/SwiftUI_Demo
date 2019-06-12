//
//  UserData.swift
//  SYSwiftUITodo
//
//  Created by Seoyeong Heo on 2019/06/11.
//  Copyright © 2019 SYSwiftUITodo. All rights reserved.
//

import Combine
import SwiftUI

private let defaultTasks: [Task] = [
    Task(title: "Task 1", isDone: false),
    Task(title: "Task 2", isDone: true),
]

final class UserData: BindableObject {
    let didChange = PassthroughSubject<UserData, Never>()
    
    @UserDefaultValue(key: "Tasks", defaultValue: defaultTasks)
    var tasks: [Task] {
        didSet {
            didChange.send(self)
        }
    }
}
