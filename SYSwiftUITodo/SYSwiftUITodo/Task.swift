//
//  Task.swift
//  SYSwiftUITodo
//
//  Created by Seoyeong Heo on 2019/06/11.
//  Copyright © 2019 SYSwiftUITodo. All rights reserved.
//

import SwiftUI

struct Task: Hashable, Codable, Identifiable {
    let id: UUID
    var title: String
    var isDone: Bool
    
    init(title: String, isDone: Bool) {
        self.id = UUID()
        self.title = title
        self.isDone = isDone
    }
}
