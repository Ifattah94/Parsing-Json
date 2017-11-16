//
//  Weather.swift
//  Json Exercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
class City {
    var name: String
    var currentTemp: Double
    var currentWeatherSummary: String
    init(name: String, currentTemp: Double, currentWeatherSummary: String) {
        self.name = name
        self.currentTemp = currentTemp
        self.currentWeatherSummary = currentWeatherSummary
    }
    convenience init?(from dict: [String: Any]) {
        guard let name = dict["name"] as? String else {print("no");return nil}
        var temp: Double = 0
        var summary: String = ""
        
        if let mainDict = dict["main"] as? [String: Any] {
            if let unwrappedTemp = mainDict["temp"] as? Double {
                temp = unwrappedTemp
            }
            
        }
        if let weatherDictArr = dict["weather"] as? [[String: Any]] {
            if let weatherDict = weatherDictArr.first {
                if let unwrappedSummary = weatherDict["main"] as? String {
                    summary = unwrappedSummary
                }
            }
            
        }
        self.init(name: name, currentTemp: temp, currentWeatherSummary: summary)
        
    }
    static func getCities(from data: Data) -> [City] {
        var cities = [City]()
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {print("no1");return []}
        guard let jsonDict = json as? [String: Any] else {print("no2");return []}
        guard let listDictArr = jsonDict["list"] as? [[String: Any]] else {print("no3");return []}
        for city in listDictArr {
            if let newCity = City(from: city) {
                cities.append(newCity)
            }
            
        }
        
   
        return cities
}
}
