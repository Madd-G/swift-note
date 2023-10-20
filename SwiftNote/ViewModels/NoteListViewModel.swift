//
//  NoteListViewModel.swift
//  SwiftNote
//
//  Created by Akhmad Nur Alamsyah on 20/10/23.
//

import Foundation
import FirebaseFirestore

/// ViewModel for list of items view
/// Primary tab
class NoteListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete (id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
