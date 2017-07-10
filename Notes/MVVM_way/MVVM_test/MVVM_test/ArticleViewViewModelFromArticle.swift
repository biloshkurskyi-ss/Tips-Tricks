//
//  ArticleViewViewModelFromArticle.swift
//  MVVM_test
//
//  Created by Sergey Biloshkurskyi on 7/9/17.
//  Copyright © 2017 Sergey Biloshkurskyi. All rights reserved.
//

import UIKit

class ArticleViewViewModelFromView: ArticleViewViewModel {
    let article: Article
    let title: Dynamic<String>
    let body: Dynamic<String>
    let date: Dynamic<String>
    let thubnail: Dynamic<UIImage?>
    
    init(_ article: Article) {
        self.article = article
        
        self.title = Dynamic(article.title)
        self.body = Dynamic(article.body)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        self.date = Dynamic(dateFormatter.string(from: article.date))
        
        self.thubnail = Dynamic(nil)
        
        let downloadTask = URLSession.shared.downloadTask(with: article.url) { [weak self] (url, response, error) in
            do {
                let data = try Data(contentsOf: url!)
                if let img = UIImage(data: data) {
                    self?.thubnail.value = img
                }
            } catch {
                print(error)
            }
        }
        
        downloadTask.resume()
    }
    
}
