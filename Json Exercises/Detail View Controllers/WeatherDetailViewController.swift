//
//  WeatherDetailViewController.swift
//  Json Exercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    
    var myCity: City?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let myCity = myCity else {
            return
        }
        cityLabel.text = myCity.name
        weatherLabel.text = myCity.currentWeatherSummary

        // Do any additional setup after loading the view.
    }

  
}
