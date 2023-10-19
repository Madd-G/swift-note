//
//  ContentView.swift
//  SwiftNote
//
//  Created by Akhmad Nur Alamsyah on 19/10/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentuserId.isEmpty {
         HomeView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
