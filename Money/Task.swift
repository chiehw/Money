//
//  Task.swift
//  Money
//
//  Created by Mac on 2023/4/21.
//
import SwiftUI

struct Task: Equatable, Hashable, Identifiable, Codable {
    let id: UUID
    var title: String
    var isDone: Bool
    
    init(title: String, isDone: Bool) {
        self.id = UUID()
        self.title = title
        self.isDone = isDone
    }
}
