//
//  Task.swift
//  Money
//
//  Created by Mac on 2023/4/21.
//
import SwiftUI

struct Task: Equatable, Hashable, Identifiable {
    let id: UUID = UUID()
    var title: String
    var isDone: Bool
}
