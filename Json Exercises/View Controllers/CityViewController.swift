//
//  CityViewController.swift
//  Json Exercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class CityViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var cityTableView: UITableView!
    var cities = [City]()
    func loadData() {
        if let path = Bundle.main.path(forResource: "Weather", ofType: "Json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.cities = City.getCities(from: data)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = cities[indexPath.row]
        let cell = cityTableView.dequeueReusableCell(withIdentifier: "City Cell", for: indexPath)
        cell.textLabel?.text = city.name
        cell.detailTextLabel?.text = city.currentWeatherSummary
        return cell 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationCity = segue.destination as? WeatherDetailViewController {
            let selectedRow = cityTableView.indexPathForSelectedRow?.row
            let selectedCity = cities[selectedRow!]
            destinationCity.myCity = selectedCity
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.cityTableView.delegate = self
        self.cityTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

   

}
