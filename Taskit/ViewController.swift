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
   
    var baseArray:[[TaskModel]] = []
    
    var sortOrder:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    
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
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return baseArray[section].count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        
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
    
    
    func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 25
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To Do"
        }
        else {
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        
        if indexPath.section == 0 {
        
        var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, completed: true)
        baseArray[1].append(newTask)
        }
        else {
            var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, completed: false)
            baseArray[0].append(newTask)
        }
        
        baseArray[indexPath.section].removeAtIndex(indexPath.row)
        refreshTable()
    }
    
    //helpers
    func refreshTable () {
        
        
        if sortOrder == true {
            baseArray[0] = baseArray[0].sorted{
                (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
                return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
            }}
            else if sortOrder == false {
                baseArray[0] = baseArray[0].sorted{
                    (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
                    return taskOne.date.timeIntervalSince1970 > taskTwo.date.timeIntervalSince1970
                }
            }
        
        
        
        
        self.tableView.reloadData()
        
    }
    
}


