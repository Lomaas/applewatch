//
//  InterfaceController.swift
//  todoapp WatchKit Extension
//
//  Created by Simen Johannessen on 15/06/15.
//  Copyright © 2015 bekk. All rights reserved.
//

import WatchKit
import Foundation
import WatchCom


class InterfaceController: WKInterfaceController {
    static let rowTypeIdentifier = "mainRowType"
    
    var tableData = [
        Todo(title: "Wash diches", date: NSDate()),
        Todo(title: "Buy milk", date: NSDate()),
        Todo(title: "Read doc.", date: NSDate())
    ]
    
    @IBOutlet var tableView: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        WKInterfaceController.openParentApplication(["r" : "fsf"]) {
            (replyInfo, error) -> Void in
            
        }
        configureTable()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        tableData.removeAtIndex(rowIndex)
        configureTable()
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    private func configureTable() {
        tableView.setNumberOfRows(tableData.count, withRowType: InterfaceController.rowTypeIdentifier)
        print("row data: \(tableView.numberOfRows)")
        
        for var index = 0; index < tableView.numberOfRows; index++ {
            let row = tableView.rowControllerAtIndex(index) as! TodoRowController
            let todo = tableData[index]
            row.rowTitle.setText(todo.title)
        }
    }
}
