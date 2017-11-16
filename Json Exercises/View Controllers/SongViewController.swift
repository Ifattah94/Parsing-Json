//
//  ViewController.swift
//  Json Exercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class SongViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var songTableView: UITableView!
    
    
    var songs = [Song]()
    func loadData() {
        if let path = Bundle.main.path(forResource: "Song", ofType: "Json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.songs = Song.getSongs(from: data)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = songs[indexPath.row]
        let cell = self.songTableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationSong = segue.destination as? SongDetailViewController {
            let selectedRow = songTableView.indexPathForSelectedRow?.row
            let selectedSong = songs[selectedRow!]
            destinationSong.mySong = selectedSong
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.songTableView.delegate = self
        self.songTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }



}

