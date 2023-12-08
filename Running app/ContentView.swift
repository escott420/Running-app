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
    @State private var speedText = ""
    var body: some View {
        NavigationView{
            VStack {
                //Adds Title and images
                Image("calculator").resizable().frame(width: 150, height: 150)
                
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
                Spacer()
                Text(speedText).bold()
                Spacer()
                NavigationLink("Learn how to train!", destination: TrainingView())
                Spacer()
                
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
                       if (finalMinutes < 5)
                        {
                           speedText = "Wow thats fast!"
                       }
                        else if (finalMinutes < 7)
                        {
                            speedText = "Nice tempo!"
                        }
                        else if (finalMinutes < 20)
                        {
                            speedText = "Nice run!"
                        }
                    }
                }
            }
            }
        return finalSeconds
        }
    
}


struct TrainingView: View{
    var body: some View {
        VStack{
            Image("stats").resizable().frame(width: 200, height: 150)
            Text("Effective training for a 5K involves a gradual increase in running distance, incorporating interval training, strength exercises, and proper rest to build endurance and improve overall performance").bold()
            
                }
                Spacer()
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

