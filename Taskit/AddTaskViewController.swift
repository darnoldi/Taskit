//
//  AddTaskViewController.swift
//  Taskit
//
//  Created by Dave Arnoldi on 2014/10/17.
//  Copyright (c) 2014 Dave Arnoldi. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelButtonTapped(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
   

}
