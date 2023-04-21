//
//  UserData.swift
//  Money
//
//  Created by Mac on 2023/4/21.
//

import SwiftUI
import Combine

private let defaultTasks: [Task] = [
    Task(title: "Read SwiftUI Documentation", isDone: false),
    Task(title: "Watch WWWDC19 Keynote", isDone: true),
]

final class UserData: ObservableObject {
    let didChange = PassthroughSubject<UserData, Never>();
    var tasks: [Task] = defaultTasks {
        didSet {
            self.didChange.send(self);
        }
    }
}
