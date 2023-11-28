//
//  ContentView.swift
//  Running app
//
//  Created by Ethan Scott on 11/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enterTimeTextField = ""
    @State private var enterDistanceTextField = ""
    var body: some View {
        VStack {
            //Adds Title and images
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Running Calculator!").bold()
            Spacer()
            //Adds text to help the user
            HStack {
                Text("Enter time ran")
                Spacer()
                Text("Enter miles ran")
            }
            // This HStack has the text fields where the user enters how far they ran and how long
            HStack{
                CustomTextField(placeholder: "00:00:00", variable: $enterTimeTextField)
                CustomTextField(placeholder: "0", variable: $enterDistanceTextField)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct CustomTextField: View {
    let placeholder : String
    let variable : Binding<String>
    var body: some View {
        TextField(placeholder, text: variable)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .frame(width: 160, height: 35, alignment: .center)
            .font(.body)
            .padding()
    }
}
struct CustomText: View {
    let text : String
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.bold)
    }
}

