//
//  MainViewModel.swift
//  SwiftNote
//
//  Created by Akhmad Nur Alamsyah on 19/10/23.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    @Published var currentuserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self]_, user in
            DispatchQueue.main.async {
                self?.currentuserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
        
    }
}
