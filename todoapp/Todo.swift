//
//  Todo.swift
//  todoapp
//
//  Created by Simen Johannessen on 15/06/15.
//  Copyright © 2015 bekk. All rights reserved.
//

import WatchKit

class Todo: NSObject {

    let title: String
    let date: NSDate
    
    init(title: String, date: NSDate) {
        self.title = title
        self.date = date
    }
}
