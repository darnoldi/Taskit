//
//  TaskDetailViewController.swift
//  Taskit
//
//  Created by Dave Arnoldi on 2014/10/17.
//  Copyright (c) 2014 Dave Arnoldi. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var detailTaskModel: TaskModel!
    
    @IBOutlet weak var taskTextField: UITextField!
    
    @IBOutlet weak var subTaskTextField: UITextField!
    
    @IBOutlet weak var doDatePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.taskTextField.text = detailTaskModel.task
        self.subTaskTextField.text = detailTaskModel.subTask
        self.doDatePicker.date = detailTaskModel.date
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
   
}
