//
//  ContentView.swift
//  Weather in SwiftUI
//
//  Created by Anđelko on 04.May.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue,.white],
                            startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 8) {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack {
                    Image(systemName:  "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, alignment: .center)
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                HStack(spacing: 10) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 68)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.hail.fill", temperature: 68)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.drizzle.fill", temperature: 68)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.bolt.fill", temperature: 68)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.bolt.fill", temperature: 68)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text("\(dayOfWeek)")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName:  "\(imageName)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            Text("\(temperature)")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
