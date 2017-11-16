//
//  Color.swift
//  Json Exercises
//
//  Created by C4Q on 11/15/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
class Color {
    var hex: String
    var r: Double
    var g: Double
    var b: Double
    init(r: Double, g: Double, b: Double, hex: String) {
        self.r = r
        self.g = g
        self.b = b
        self.hex = hex
    }
    convenience init?(from dict: [String: Any]) {
        
        guard let rgbDict = dict["rgb"] as? [String: Any] else {return nil}
        guard let r = rgbDict["r"] as? Double else {return nil}
        
        guard let g = rgbDict["g"] as? Double else {return nil}
        guard let b = rgbDict["b"] as? Double else {return nil}
        
        
        var hex: String = ""
        if let hexDict = dict["hex"] as? [String:Any] {
            if let unwrappedHex = hexDict["value"] as? String {
                hex = unwrappedHex
            }
        }
        self.init(r: r, g: g, b: b, hex: hex)
    }
    static func getColors(from data: Data) -> [Color] {
        var colors = [Color]()
        print("call to getColors")
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {return []}
        print("got json")
        guard let jsonDict = json as? [String:Any] else {return[]}
        print("got big dict")

        guard let colorsDictArr = jsonDict["colors"] as? [[String:Any]] else {return []}
        print("got array of dict")

        for color in colorsDictArr {
            if let newColor = Color(from: color) {
                colors.append(newColor)
            }
        }
        return colors
    }
}
