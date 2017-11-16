//
//  NewsDetailViewController.swift
//  Json Exercises
//
//  Created by C4Q on 11/15/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var authorLabel: UILabel!
    
    
    var myArticle: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let myArticle = myArticle else {
            return
        }
        titleLabel.text = myArticle.title
        authorLabel.text = myArticle.author


        // Do any additional setup after loading the view.
    }

  

}
