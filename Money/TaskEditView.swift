//
//  TaskEditView.swift
//  Money
//
//  Created by Mac on 2023/4/21.
//

import SwiftUI

struct TaskEditView: View {
    @EnvironmentObject var userData: UserData
    private let task: Task
    private var draftTitle: State<String>
    
    init(task: Task) {
        self.task = task
        self.draftTitle = .init(initialValue: task.title)
    }
    
    private func updateTask() {
        guard let index = self.userData.tasks.firstIndex(of: self.task) else { return }
        self.userData.tasks[index].title = self.draftTitle.wrappedValue
    }
    
    var body: some View {
        return VStack(alignment: .leading, spacing: 0) {
            let inset = EdgeInsets(top: -8, leading: -10, bottom: -7, trailing: -10)
            TextField("Enter New Title...",
                      text: self.draftTitle.projectedValue,
                      onEditingChanged: { isEditing in
                        if !isEditing {
                            self.updateTask()
                        }
                      }
            ).background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.clear)
                    .border(Color(red: 0.7, green: 0.7, blue: 0.7), width: 1)
                    .padding(inset)
            ).padding(
                EdgeInsets(
                    top: 15 - inset.top,
                    leading: 20 - inset.leading,
                    bottom: 15 - inset.bottom,
                    trailing: 20 - inset.trailing
                )
            )
            Spacer()
        }.navigationTitle("Edit Task 📝")
    }
}

struct TaskEditView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditView(task: Task(title: "Read SwiftUI Documentation", isDone: false))
    }
}
