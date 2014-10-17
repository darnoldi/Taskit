//
//  Date.swift
//  Taskit
//
//  Created by Dave Arnoldi on 2014/10/17.
//  Copyright (c) 2014 Dave Arnoldi. All rights reserved.
//

import Foundation

class Date {
    
    class func from (#year:Int, month: Int, day:Int) -> NSDate {
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalender = NSCalendar(identifier: NSGregorianCalendar)
        
        var date = gregorianCalender.dateFromComponents(components)
        
        return date!
        
        
    }
    
    class func toString(#date:NSDate) -> String {
        
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyy-MM-dd"
        
        let dateString = dateStringFormatter.stringFromDate(date)
        
        
        
        
        return dateString
        
    }
    
    
}