//
//  ContentView.swift
//  Running app
//
//  Created by Ethan Scott on 11/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enterHoursTextField = ""
    @State private var enterMinutesTextField = ""
    @State private var enterSecondsTextField = ""
    @State private var enterDistanceTextField = ""
    @State private var totalMinutes = 0.0
    @State private var totalSeconds = 0
    @State private var temp = 0.0
    @State private var paceSeconds = 0.0
    @State private var finalSeconds = 0.0
    @State private var tempPace = 0.0
    @State private var finalMinutes = 0.0
    var body: some View {
        VStack {
            //Adds Title and images
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Running Calculator!").bold()
        
            
            // This HStack has the text fields where the user enters how far they ran and how long
            VStack{
                CustomTextField(placeholder: "Enter hours ran", variable: $enterHoursTextField)
                CustomTextField(placeholder: "Enter minutes ran", variable: $enterMinutesTextField)
                CustomTextField(placeholder: "Enter seconds ran", variable: $enterSecondsTextField)
                CustomTextField(placeholder: "Enter distance ran", variable: $enterDistanceTextField)
                
            }
            Text("Your pace is " + String(format: "%.2f",  finalMinutes) + " minutes and " + String(format: "%.2f",  finalSeconds) + " seconds per mile" )
            Button("Calculate Pace!"){
                calculatePace()
            }
        }
    }
    func calculatePace() -> Double{
        totalMinutes = 0.0
        if let HoursRan = Double(enterHoursTextField){
            if let MinutesRan = Double(enterMinutesTextField){
                if let secondsRan = Double(enterSecondsTextField){
                    if let distanceRan = Double(enterDistanceTextField){
                        if HoursRan > 0 {
                            totalMinutes += HoursRan * 60
                        }
                         if MinutesRan > 0
                        {
                            totalMinutes += MinutesRan
                        }
                        totalMinutes += secondsRan/60
                        tempPace = totalMinutes/distanceRan
                        temp = tempPace - Double(Int(tempPace))
                        paceSeconds = temp / (100/60)
                        finalMinutes = Double(Int(tempPace))
                        finalSeconds = paceSeconds * 100
                        
                      
                        
                        
                    }
                }
            }
            }
        return finalSeconds
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



// custom text feild struct
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

