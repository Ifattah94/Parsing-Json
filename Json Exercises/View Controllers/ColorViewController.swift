//
//  ColorViewController.swift
//  Json Exercises
//
//  Created by C4Q on 11/15/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var colorTableView: UITableView!
    var colors = [Color]()
    func loadData() {
        if let path = Bundle.main.path(forResource: "Color", ofType: "Json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.colors = Color.getColors(from: data)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = colors[indexPath.row]
        let cell = colorTableView.dequeueReusableCell(withIdentifier: "Color Cell", for: indexPath)
        cell.textLabel?.text = color.hex
        cell.detailTextLabel?.text = "\(color.r), \(color.g), \(color.b) "
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.colorTableView.delegate = self
        self.colorTableView.dataSource = self 

        // Do any additional setup after loading the view.
    }



}
