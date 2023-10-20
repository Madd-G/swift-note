//
//  NewNoteView.swift
//  SwiftNote
//
//  Created by Akhmad Nur Alamsyah on 20/10/23.
//

import SwiftUI

struct NewNoteView: View {
    @StateObject var viewModel = NewNoteViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Note")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                TextField("Note", text: $viewModel.note,  axis: .vertical)
                    .lineLimit(5...10)
                
                // Due Date
//                DatePicker( "Due Date",selection: $viewModel.dueDate)
//                    .datePickerStyle(GraphicalDatePickerStyle())
                
                MyButton(title: "Save", backgroundColor: .pink, textColor: .white) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select due date that is today or newer"))
            }
        }
    }
}

#Preview {
    NewNoteView(newItemPresented: Binding(get: {return true}, set: { _ in
        
    }))
}
