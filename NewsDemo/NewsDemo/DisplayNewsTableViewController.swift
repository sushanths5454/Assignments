//
//  DisplayNewsTableViewController.swift
//  NewsDemo
//
//  Created by Sushanth S on 07/06/21.
//

import UIKit

class DisplayNewsTableViewController: UITableViewController, newsReceived {
    func callReloadMethod() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    let newsViewModel = NewsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        newsViewModel.delgate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsViewModel.newsCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? newsTableViewCell {
            let news = newsViewModel.fetchNewAtIndex(index: indexPath.row)
            print("received news = \(news)")
            
            cell.title.text = news.title
            cell.id.text = "\(news.id)"
            cell.launch.text = "\(news.launch.count)"
            return cell
            
        }

       
print("Nothing received")
        return newsTableViewCell()
    }
    
    @IBAction func refreshTappe(_ sender: UIBarButtonItem) {
        newsViewModel.fetchNews()
        self.tableView.reloadData()
        
    }
    

}


