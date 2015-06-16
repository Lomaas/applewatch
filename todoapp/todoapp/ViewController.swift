//
//  ViewController.swift
//  todoapp
//
//  Created by Simen Johannessen on 15/06/15.
//  Copyright © 2015 bekk. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {
    class Todo: NSObject {
        
        let title: String
        let date: NSDate
        
        init(title: String, date: NSDate) {
            self.title = title
            self.date = date
        }
    }

    @IBOutlet weak var status: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = WCSession.defaultSession()
        do {
            print("trying to send data")
            status.text = "trying to send data"
            try session.updateApplicationContext([
                "todos" : [
                    ["title" : "Wash diches", "date": NSDate()],
                    ["title" : "Buy milk", "date": NSDate()],
                    ["title" : "Read doc.", "date": NSDate()]
                ]
            ])
        } catch let error as NSError {
            print("Error sending data to watchapp: \(error.localizedDescription)")
            status.text = "Error sending data"
        }
    }
}

