//
//  ContentView.swift
//  WeatherApp
//
//  Created by Muhammad muzamal on 20/07/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = WeatherViewModel(weatherRepository:WeatherApiRepository())
    var body: some View {
        ZStack(alignment: .bottom){
             Image("mountainSky")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("Islamabad")
                    .font(.system(size:41,weight: .light))
                    .foregroundColor(.white)
                    .padding(.top,98)
                Text(vm.currentWeather())
                    .font(.system(size:70, weight: .light))
                   .foregroundColor(.white)
                Text("Mostly Clear")
                    .foregroundColor(.gray)
                    .font(.system(size:18, weight: .semibold))
                Spacer()
               RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .frame(height: 500)
                    .foregroundColor(Color("gColor"))
                    .mask(
                        LinearGradient(colors: [.black,.black,.black,.clear], startPoint: .bottom, endPoint: .top))
            }
             Image("house")
                 .resizable()
                 .scaledToFill()
                 .frame(width: 390, height:390)
                 .padding(.bottom,150)
       //   ZStack{
         //     LinearGradient(colors: [Color("gColor1"),Color("gColor")], startPoint: .bottomTrailing, endPoint: .topLeading)
           //       .cornerRadius(44)
             //        .frame(height:325)
               //      .saturation(1)
                     
             //}
                 
        }
        .background(Color("hBack"))
        .task{
            do{
                try await vm.fetchWeatherData()
            }catch{
                print("\(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
