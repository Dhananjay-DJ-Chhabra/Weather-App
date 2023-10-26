//
//  HomeViewModel.swift
//  Weather-App
//
//  Created by Dhananjay Chhabra on 27/10/23.
//

import Foundation
import UIKit



class HomeViewModel{
    
    let hourlyWeatherData: [HourlyWeatherDataModel] = [
        HourlyWeatherDataModel(time: "Now", logo: "cloud", temperature: "18º", palletColors: [.black]),
        HourlyWeatherDataModel(time: "15:00", logo: "cloud.fog", temperature: "17º", palletColors: [.black, .blue]),
        HourlyWeatherDataModel(time: "16:00", logo: "cloud.sun", temperature: "17º", palletColors: [.black, .orange]),
        HourlyWeatherDataModel(time: "17:00", logo: "cloud.sun", temperature: "16º", palletColors: [.black, .orange]),
        HourlyWeatherDataModel(time: "17:33", logo: "sunset.fill", temperature: "16º", palletColors: [.black, .orange]),
        HourlyWeatherDataModel(time: "18:00", logo: "moon.fill", temperature: "15º", palletColors: [.orange]),

    ]
    
    
    let fifteenDaysWeatherForecast: [FifteenDaysWeatherDataModel] = [
        FifteenDaysWeatherDataModel(day: "Today", logo: "cloud.sun", weather: "Partly Cloudy", temperatureRange: "18º/8º", palletColors: [.black, .orange]),
        FifteenDaysWeatherDataModel(day: "Tommorow", logo: "cloud.fog", weather: "Fog", temperatureRange: "21º/10º", palletColors: [.black, .blue]),
        FifteenDaysWeatherDataModel(day: "Thu", logo: "cloud.fog", weather: "Fog", temperatureRange: "21º/12º", palletColors: [.black, .blue]),
        FifteenDaysWeatherDataModel(day: "Fri", logo: "cloud.fog", weather: "Fog", temperatureRange: "22º/9º", palletColors: [.black, .blue]),
        FifteenDaysWeatherDataModel(day: "Sat", logo: "sun.max", weather: "Sunny", temperatureRange: "20º/8º", palletColors: [.orange]),
        FifteenDaysWeatherDataModel(day: "Sun", logo: "sun.max", weather: "Sunny", temperatureRange: "19º/7º", palletColors: [.orange]),
        FifteenDaysWeatherDataModel(day: "Mon", logo: "sun.max", weather: "Sunny", temperatureRange: "19º/6º", palletColors: [.orange])
    ]
    
    let weatherDetailsCards: [WeatherDetailsCardDataModel] = [
        WeatherDetailsCardDataModel(logo: "thermometer.medium", palletColors: [.black], parameter: "Feels like", value: "16º", units: ""),
        WeatherDetailsCardDataModel(logo: "wind", palletColors: [.black], parameter: "W wind", value: "13", units: "km/h"),
        WeatherDetailsCardDataModel(logo: "drop", palletColors: [.black], parameter: "Humidity", value: "62", units: "%"),
        WeatherDetailsCardDataModel(logo: "sun.max", palletColors: [.black], parameter: "UV", value: "0", units: "Very weak"),
        WeatherDetailsCardDataModel(logo: "eye", palletColors: [.black], parameter: "Visibility", value: "1", units: "km"),
        WeatherDetailsCardDataModel(logo: "water.waves.and.arrow.down", palletColors: [.black], parameter: "Air pressure", value: "1017", units: "hPa")
    ]
    
    
}
