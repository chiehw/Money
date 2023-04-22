//
//  TaskItemView.swift
//  Money
//
//  Created by Mac on 2023/4/22.
//

import SwiftUI

struct TaskItemView: View {
    @EnvironmentObject var userData: UserData
    
    let task: Task
    @Binding var isEditing: Bool    // param
    
    private func delete() {
        self.userData.tasks.removeAll(where: { $0.id == self.task.id })
        self.userData.objectWillChange.send()
        if self.userData.tasks.isEmpty {
            self.isEditing = false
        }
    }
    
    private func toggleDone() {
        guard !self.isEditing else { return }
        guard let index = self.userData.tasks.firstIndex(where: {$0.id == self.task.id }) else { return }
        self.userData.tasks[index].isDone.toggle()
        self.userData.objectWillChange.send()
    }
    
    var body: some View {
        HStack {
            if self.isEditing {
                Image(systemName: "minus.circle")
                    .foregroundColor(.red)
                    .onTapGesture {
                        self.delete()
                    }
                NavigationLink(
                    destination: TaskEditView(
                        task: task
                    )
                    .environmentObject(
                        self.userData
                    )
                ){
                    Text(task.title)
                }
            } else {
                Button(action: { self.toggleDone() } ) {
                    Text(self.task.title)
                }
                Spacer()
                if task.isDone {
                    Image(systemName: "checkmark").foregroundColor(.green)
                }
            }
        }
    }
}

struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        TaskItemView(
            task: Task(title: "Hello World", isDone: true), isEditing: .constant(false)
        )
        .environmentObject(UserData())
    }
}
