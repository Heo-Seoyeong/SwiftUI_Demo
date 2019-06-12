//
//  TaskListView.swift
//  SYSwiftUITodo
//
//  Created by Seoyeong Heo on 2019/06/11.
//  Copyright © 2019 SYSwiftUITodo. All rights reserved.
//

import SwiftUI

struct TaskListView : View {
    
    @EnvironmentObject var userData: UserData
    @State var draftTitle: String = ""
    @State var isEditing: Bool = false

    var body: some View {
        List {
            TextField($draftTitle, placeholder: Text("Create Task"), onCommit: self.createTask)
            ForEach(self.userData.tasks) { task in
                TaskRowView(task: task, isEditing: self.$isEditing)
            }
        }
        .navigationBarItem(title: Text("Todo List"))
        .navigationBarItems(trailing: Button(action: { self.isEditing.toggle() }) {
            if !self.isEditing {
                Text("Edit")
            } else {
                Text("Done").bold()
            }
        })
    }

    private func createTask() {
        let newTask = Task(title: self.draftTitle, isDone: false)
        self.userData.tasks.insert(newTask, at: 0)
        self.draftTitle = ""
    }

}

#if DEBUG
struct TaskListView_Previews : PreviewProvider {
    static var previews: some View {
        TaskListView().environmentObject(UserData())
    }
}
#endif
