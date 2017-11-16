//
//  News.swift
//  Json Exercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
class News {
    var title: String
    var author: String
    var summary: String
    init(title: String, author: String, summary: String) {
        self.title = title
        self.author = author
        self.summary = summary
    }
   
    convenience init?(dict: [String: Any]) {
        guard let author = dict["author"] as? String else {return nil}
        guard let title = dict["title"] as? String else {return nil}
        guard let summary = dict["description"] as? String else {return nil}
        self.init(title: title, author: author, summary: summary)
    }
    
    
    
    static func getNews(from data: Data) -> [News] {
        var news = [News]()
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {return []}
        guard let jsonDict = json as?
            [String:Any] else {return []}
        guard let articleDictArr = jsonDict["articles"] as? [[String:Any]] else {return []}
        for newsArticle in articleDictArr {
            if let newNews = News(dict: newsArticle) {
                news.append(newNews)
            }
        }
        return news
    }
    
}
