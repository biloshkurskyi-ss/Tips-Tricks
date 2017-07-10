//
//  ViewController.swift
//  MVVM_test
//
//  Created by Sergey Biloshkurskyi on 7/9/17.
//  Copyright © 2017 Sergey Biloshkurskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var bodyTextLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var viewModel: ArticleViewViewModel! {
        didSet {
            viewModel.title.bindAndFire { [unowned self] in
                self.titleLabel.text = $0
            }
            viewModel.body.bindAndFire { [unowned self] in
                self.bodyTextLabel.text = $0
            }
            viewModel.date.bindAndFire { [unowned self] in
                self.dateLabel.text = $0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let article = Article()
        article.title = "Title"
        article.body = "Body"
        article.date = Date()
        article.url = URL(string: "https://github.com/StackExchange/stack-blog/blob/master/images/adding_authors.png")
        
        let viewModel = ArticleViewViewModelFromView(article)
        self.viewModel = viewModel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

