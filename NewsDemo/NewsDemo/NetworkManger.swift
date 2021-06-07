//
//  NetworkManger.swift
//  NewsDemo
//
//  Created by Sushanth S on 04/06/21.
//

import Foundation
protocol sendNews{
    func sendNewsObject(object: [News])
}

class NetworkManager {
    
    var delegate: sendNews?
    
    func fetchNewsData() {
        guard let newsURl = URL(string: "https://api.spaceflightnewsapi.net/v3/articles") else {
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: newsURl)  {
            [weak self]
            
             (data, response, error) in
            if error != nil {
                print(error.debugDescription)
            }
            
            guard let newsData = data else {
                return
            }
            do {
                let newData = try JSONSerialization.jsonObject(with: newsData, options: [])
                if let news = self?.fetchNewsData(data: newData) {
                    print("newsss \(news)")
                    self?.delegate?.sendNewsObject(object: news)
                } else {
                    
                    self?.delegate?.sendNewsObject(object: [News]())
                }
                
            } catch {
                print("erro")
            }
            
            
        }
            
          
        
        dataTask.resume()
    }
    
    
    
    
    
    
    func fetchNewsData(data: Any) -> [News] {
        
        var finalNews = [News] ()
        guard let newsData  = data as? [Any]
        else {
            
            return finalNews
        }
        
        for news in newsData {
            
            if let tempNews = news as? [String: Any] {
                
                guard let id = tempNews["id"] as? Int,
                      let title = tempNews["title"] as? String
                else {
                    
                    return finalNews
                }
                
                let newsObject = News(id: id, title: title, launch: [Launch]())
                var launchist = [Launch]()
                if let launch = tempNews["launches"] as? [Any],
                   launch.count > 0,
                   let launchInNews = launch as? [String: String] {
                    
                    guard var launchId = launchInNews["id"] as? String,
                          let provider = launchInNews["provider"] as? String
                    else {
                        return finalNews
                        
                    }
                    launchist.append(Launch(id: launchId, provider: provider))
                    
                      
                }
                newsObject.launch = launchist
                finalNews.append(newsObject)
                            
            }
                    
        }
        print(finalNews)
        return finalNews
    }

}
