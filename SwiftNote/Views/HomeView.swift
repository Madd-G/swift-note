//
//  HomeView.swift
//  SwiftNote
//
//  Created by Akhmad Nur Alamsyah on 19/10/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct HomeView: View {
    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var homeViewModel : HomeViewModel
    @FirestoreQuery var items: [Note]
    @State private var isShowingProfileView = false
    
    init(userId: String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._homeViewModel = StateObject(
            wrappedValue: HomeViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            NavigationStack {
                            ZStack(alignment: .bottomTrailing) {
                                List(items) { item in
                                    NoteListItemView(item: item)
                                        .swipeActions {
                                            Button("Delete") {
                                                homeViewModel.delete(id: item.id)
                                            } .tint(.red)
                                        }
                                }
                                .listStyle(PlainListStyle())
                    
                                .navigationTitle("Notes")
                                            .toolbar{
                                                Button {
                                                    isShowingProfileView = true
                                                }
                                                label : {
                                                    Image(systemName: "plus")
                                
                                                }
                                                .navigationDestination(isPresented: $isShowingProfileView, destination: { ProfileView()})

                                            }
                                
                                Button {
                                    homeViewModel.showingNewItemView = true
                                } label: {
                                    // 1
                                    Image(systemName: "plus")

                                        .font(.title.weight(.semibold))

                                        .padding()

                                        .background(Color.pink)

                                        .foregroundColor(.white)

                                        .clipShape(Circle())

                                }
                                .padding()
                                
                                .sheet(isPresented: $homeViewModel.showingNewItemView, content: {
                                    NewNoteView(newItemPresented: $homeViewModel.showingNewItemView)
                                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Sheet Content")/*@END_MENU_TOKEN@*/
                                })
                            }
                        }
        }
    }
}
    
#Preview {
    HomeView(userId: "K5z8uJvFSlfSx6plcrP5FcM8Fq32")
}

