//
//  TaskListView.swift
//  Money
//
//  Created by Mac on 2023/4/21.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var userData: UserData
    @State var draftTitle: String = ""
    @State var isEditing: Bool = false
    
    private func createTask() {
        let newTask = Task(title: self.draftTitle, isDone: false)
        self.userData.tasks.insert(newTask, at: 0)
        self.draftTitle = ""
    }
    
    private func toggleDone(of task: Task) {
        guard !self.isEditing else { return }
        guard let index = self.userData.tasks.firstIndex(where: { $0.id == task.id }) else { return }
        self.userData.tasks[index].isDone.toggle()
    }
    
    private func delete(task: Task) {
        self.userData.tasks.removeAll(where: { $0.id == task.id })
        if self.userData.tasks.isEmpty {
            self.isEditing = false
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                TextField("Create a new Task...", text: $draftTitle, onCommit: self.createTask)    // Title, Text, OnCommit
                
                ForEach(self.userData.tasks) { task in
                    TaskItemView(task: task, isEditing: self.$isEditing)
                }
            }
            .navigationBarTitle("Tasks 👀")
            .navigationBarItems(trailing: Button(action: { self.isEditing.toggle() }) {
                if !self.isEditing {
                    Text("Edit")
                } else {
                    Text("Done").bold()
                }
            })
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environmentObject(UserData())
    }
}
