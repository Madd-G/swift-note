//
//  Note.swift
//  SwiftNote
//
//  Created by Akhmad Nur Alamsyah on 19/10/23.
//

import Foundation

struct Note: Codable, Identifiable {
    let id: String
    let title: String
    let note: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
