//
//  Song.swift
//  Json Exercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
class Song {
    var name: String
    var artist: String
    var songID: String
    init(name: String, artist: String, songID: String) {
        self.name = name
        self.artist = artist
        self.songID = songID
    }
    convenience init?(dict: [String: Any]) {
        guard let name = dict["song_name"] as? String else {return nil}
        let artist = dict["display_artist"] as? String ?? "Unknown Artist"
        guard let songID = dict["song_id"] as? String else {return nil}
        self.init(name: name, artist: artist, songID: songID)
    }
    static func getSongs(from data: Data) -> [Song] {
        var songs = [Song]()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonArr = json as? [[String: Any]] else {return []}
            for songDict in jsonArr {
                if let song = Song(dict: songDict) {
                    songs.append(song)
                }
            }
            
        }
        catch {
            print("error")
        }
        return songs
    }
}









