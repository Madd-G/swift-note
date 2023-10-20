//
//  NewNoteViewModel.swift
//  SwiftNote
//
//  Created by Akhmad Nur Alamsyah on 20/10/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewNoteViewModel: ObservableObject {
    @Published var title = ""
    @Published var note = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newItem = Note(
            id: newId,
            title: title,
            note: note,
            dueDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !note.isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
