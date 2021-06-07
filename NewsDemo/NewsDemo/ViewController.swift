//
//  ViewController.swift
//  NewsDemo
//
//  Created by Sushanth S on 04/06/21.
//

import UIKit

class ViewController: UIViewController {
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fetchNewTapped(_ sender: UIButton) {
        networkManager.fetchNewsData()
    }
    
}

