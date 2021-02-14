//
//  NewsArticleViewModel.swift
//  Stocks
//
//  Created by Bob on 14/02/21.
//

import Foundation

struct NewsArticleViewModel {
    
    let article: Article
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
}
