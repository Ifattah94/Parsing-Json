//
//  SongDetailViewController.swift
//  Json Exercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
    
    var mySong: Song?

    
    @IBOutlet weak var songNameLabel: UILabel!
    
    
    @IBOutlet weak var artistLabel: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let mySong = mySong else {
            return
        }
        self.songNameLabel.text = mySong.name
        self.artistLabel.text = mySong.artist

        // Do any additional setup after loading the view.
    }

    


}
