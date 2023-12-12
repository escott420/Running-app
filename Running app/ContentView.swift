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
    @State private var imageName = ""
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
                    HStack{
                        Text(speedText).bold()
                        Image(imageName).resizable().frame(width: 150, height: 150)
                    }
                    Spacer()
                VStack{
                    NavigationLink("Learn how to train!", destination: TrainingView())
                    Spacer()
                    NavigationLink("Get a training Plan!", destination: TrainingPlanView())
                }
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
                           imageName = "cheetah"
                       }
                        else if (finalMinutes < 7)
                        {
                            speedText = "Nice tempo!"
                            imageName = "gazelle"
                        }
                        else if (finalMinutes < 10)
                        {
                            speedText = "Nice run!"
                            imageName = "dog"
                        }
                        else if (finalMinutes >= 10)
                        {
                            speedText = "Speed up!!"
                            imageName = "snail"
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
            Spacer()
            Text("When first starting out to run, its import to slowly increase your weekly mileage")
            Spacer()
            Text("It's also important to incorporate a variety of fast running and slow running, aswell as short runs and long runs")
            Spacer()
            Text("Some helpful tips for beginner can be: Have a good pair of shoes, keep track of your milage, and take care of any soreness to prevent injuries")
                
                }
                Spacer()
            }
        }

struct TrainingPlanView: View{
   @State private var trainingText = ""
    var body: some View {
        VStack{
            Text("Select your previous training experience:")
            Spacer()
            HStack{
                Button("Begginer"){
                    trainingText = "j"
                }
            }
            Spacer()
            Text(trainingText)
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

