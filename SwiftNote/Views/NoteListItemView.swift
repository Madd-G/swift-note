//
//  NoteListItemView.swift
//  SwiftNote
//
//  Created by Akhmad Nur Alamsyah on 20/10/23.
//

import SwiftUI

struct NoteListItemView: View {
    @StateObject var viewModel = NoteListItemViewModel()
    let item : Note
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(item.title)
                    .font(.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    NoteListItemView(item: .init(id: "id", title: "title", note: "note", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false))
}
