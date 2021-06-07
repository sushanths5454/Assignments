//
//  NewsViewModel.swift
//  NewsDemo
//
//  Created by Sushanth S on 07/06/21.
//

import Foundation
protocol  newsReceived {
    func callReloadMethod()
}

class NewsViewModel {
    
    var news = [News] ()
    var delgate: newsReceived?
    let networkManager = NetworkManager()
    func newsCount() -> Int {
        
        return news.count
    }
    
    func fetchNews() {
        networkManager.delegate = self
        networkManager.fetchNewsData()
        
    }
    func fetchNewAtIndex(index: Int) -> News {
        return news[index]
    }
    
    
}

extension NewsViewModel: sendNews {
    func sendNewsObject(object: [News]) {
        
        self.news = object
        print(news.count)
        delgate?.callReloadMethod()
    }
}

