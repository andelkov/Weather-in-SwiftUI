//
//  ContentView.swift
//  Weather in SwiftUI
//
//  Created by Anđelko on 04.May.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack(spacing: 8) {
                CityTextView(cityName: "Cupertino, CA")
                    
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                .padding(.bottom, 40)
                
                HStack(spacing: 10) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sunset.fill", temperature: 68)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.hail.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.drizzle.fill", temperature: 88)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "snow", temperature: 55)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.bolt.fill", temperature: 63)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", backgroundColor: Color.white, textColor: Color.blue)
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
                .renderingMode(.original) //.symbolRenderingMode(.hierarchical)
                .resizable()
                //.foregroundStyle(.blue)
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            Text("\(temperature)°")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient:  Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        
    }
}

struct MainWeatherStatusView: View {
    
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        
        VStack {
            Image(systemName:  imageName )
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, alignment: .center)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        
    }

}



