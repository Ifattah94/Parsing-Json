//
//  NewsViewController.swift
//  Json Exercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var newsTableView: UITableView!
    
    var news = [News]()
    func loadData() {
        if let path = Bundle.main.path(forResource: "News", ofType: "Json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.news = News.getNews(from: data)
        }
    }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = news[indexPath.row]
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "News Cell", for: indexPath)
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.author
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationNews = segue.destination as? NewsDetailViewController {
           let selectedRow = newsTableView.indexPathForSelectedRow?.row
            let selectedArticle = news[selectedRow!]
            destinationNews.myArticle = selectedArticle
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTableView.delegate = self
        self.newsTableView.dataSource = self
        loadData()


        
        // Do any additional setup after loading the view.
    }



}
