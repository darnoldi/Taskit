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
   
    var taskArray:[TaskModel] = []
    var sortOrder:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let date1 = Date.from(year: 2014, month: 05, day: 20)
        let date2 = Date.from(year: 2014, month: 03, day: 14)
        let date3 = Date.from(year: 2014, month: 06, day: 01)
        let date4 = Date.from(year: 2014, month: 05, day: 30)
        
        
        let task1 = TaskModel(task: "Study french", subTask: "parle vouz", date: date1)
        let task2 = TaskModel(task: "eat dinner", subTask: "burgers", date: date2)
        let task3 = TaskModel(task: "play guitar", subTask: "hard rock", date: date3)
        let task4 = TaskModel(task: "Sleep", subTask: "zzzzz", date: date4)
        
        taskArray = [task1, task2, task3, task4]
        
        //self.tableView.reloadData()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        refreshTable()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
            
        }
        else if segue.identifier == "showTaskAdd" {
            let addTaskVC: AddTaskViewController = segue.destinationViewController as AddTaskViewController
            addTaskVC.mainVC = self
        }
        
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    @IBAction func upButtonPressed(sender: UIButton) {
        sortOrder = true
        refreshTable()
    }
    
    @IBAction func downButtonPressed(sender: UIButton) {
        sortOrder = false
        refreshTable()
    }
    
    
    //UItableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let thisTask = taskArray[indexPath.row]
        
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        
        return cell
    }
    
    
    
    // UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    
    //helpers
    func refreshTable () {
        
        
        if sortOrder == true {
            taskArray = taskArray.sorted{
                (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
                return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
            }}
            else if sortOrder == false {
                taskArray = taskArray.sorted{
                    (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
                    return taskOne.date.timeIntervalSince1970 > taskTwo.date.timeIntervalSince1970
                }
            }
        
        
        
        
        self.tableView.reloadData()
        
    }
    
}


