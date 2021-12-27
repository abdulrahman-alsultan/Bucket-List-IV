//
//  TaskModel.swift
//  Bucket List (iOS Client-Side)
//
//  Created by admin on 26/12/2021.
//

import Foundation

class TaskModel{
    static func getAllTasks(completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        let url = URL(string: "https://saudibucketlistapi.herokuapp.com/tasks/")
        let task = URLSession.shared.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
}
