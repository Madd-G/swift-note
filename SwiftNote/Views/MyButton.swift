//
//  MyButton.swift
//  SwiftNote
//
//  Created by Akhmad Nur Alamsyah on 19/10/23.
//

import SwiftUI

struct MyButton: View {
    let title : String
    let backgroundColor : Color
    let textColor : Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(textColor)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    MyButton(title: "Title", backgroundColor: .black, textColor: .white){}
}
