//
//  ViewController.swift
//  Bucket List (iOS Client-Side)
//
//  Created by admin on 26/12/2021.
//

import UIKit

class BucketListViewController: UITableViewController {
    
    var buckets: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskModel.getAllTasks() {
            data, response, error in
            do {
                if let tasks = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray {
                    
                    for t in tasks{
                        let task = t as! NSDictionary
                        self.buckets.append(task["objective"] as! String)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch {
                print("Something went wrong")
            }
        }
    }
    
    func fetchData(){
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buckets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketCell", for: indexPath)
        
        cell.textLabel?.text = buckets[indexPath.row]
        
        return cell
    }
}

