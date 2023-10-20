//
//  NoteItemViewModel.swift
//  SwiftNote
//
//  Created by Akhmad Nur Alamsyah on 20/10/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NoteListItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: Note) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
