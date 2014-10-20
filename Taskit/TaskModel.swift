//
//  TaskModel.swift
//  Taskit
//
//  Created by Dave Arnoldi on 2014/10/20.
//  Copyright (c) 2014 Dave Arnoldi. All rights reserved.
//

import Foundation
import CoreData


@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subTask: String
    @NSManaged var task: String

}
