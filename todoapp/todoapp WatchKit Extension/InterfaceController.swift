//
//  InterfaceController.swift
//  todoapp WatchKit Extension
//
//  Created by Simen Johannessen on 15/06/15.
//  Copyright © 2015 bekk. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    struct constants {
        static let rowTypeIdentifier = "mainRowType"
    }
    
    var tableData = [
        Todo(title: "Wash diches", date: NSDate()),
        Todo(title: "Buy milk", date: NSDate()),
        Todo(title: "Read doc.", date: NSDate())
    ]
    
    @IBOutlet var tableView: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
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
        tableView.setNumberOfRows(tableData.count, withRowType: InterfaceController.constants.rowTypeIdentifier)
        print("row data: \(tableView.numberOfRows)")
        
        for index in 0...tableView.numberOfRows - 1 {
            let row = tableView.rowControllerAtIndex(index) as! TodoRowController
            let todo = tableData[index]
            row.rowTitle.setText(todo.title)
        }
    }
}
