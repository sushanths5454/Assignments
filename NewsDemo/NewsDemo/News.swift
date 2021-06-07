//
//  News.swift
//  NewsDemo
//
//  Created by Sushanth S on 07/06/21.
//

import Foundation
class News {
    
    var id: Int
    var title: String
    var launch: [Launch]
    
    init(id: Int, title: String, launch: [Launch]) {
        self.id = id
        self.title = title
        self.launch = launch
    }
    
    
}
