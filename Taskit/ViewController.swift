//
//  ViewController.swift
//  Taskit
//
//  Created by Dave Arnoldi on 2014/10/13.
//  Copyright (c) 2014 Dave Arnoldi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
   
    var taskArray:[Dictionary<String,String>] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1:Dictionary<String,String> = ["task": "Study French", "subtask": "parle vouz?", "date": "01/14/2014"]
        let task2:Dictionary<String,String> = ["task": "eat dinner", "subtask": "burgers", "date": "01/14/2014"]
        let task3:Dictionary<String,String> = ["task": "Play Guitar", "hard rock": "parle vouz?", "date": "01/16/2014"]
        let task4:Dictionary<String,String> = ["task": "chill out", "subtask": "zzzzzzz", "date": "01/17/2014"]
        
        taskArray = [task1, task2, task3, task4]
        
        //tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UItableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let taskDict:Dictionary = taskArray[indexPath.row]
        
        
        cell.taskLabel.text = taskDict["task"]
        cell.descriptionLabel.text = taskDict["subtask"]
        cell.dateLabel.text = taskDict["date"]
        
        
        return cell
    }
    
    
    
    // UITableViewDelegate
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}

