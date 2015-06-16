//
//  InterfaceController.swift
//  todoapp WatchKit Extension
//
//  Created by Simen Johannessen on 15/06/15.
//  Copyright © 2015 bekk. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    static let rowTypeIdentifier = "mainRowType"
    let session = WCSession.defaultSession()

    var tableData = [
        Todo(title: "Wash diches", date: NSDate()),
        Todo(title: "Buy milk", date: NSDate()),
        Todo(title: "Read doc.", date: NSDate())
    ]
    
    @IBOutlet var tableView: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        session.delegate = self
        session.activateSession()
    }
    
    func session(session: WCSession, didFinishUserInfoTransfer userInfoTransfer: WCSessionUserInfoTransfer, error: NSError?) {
        print("DidFinish UserInfoTransfer: \(userInfoTransfer.userInfo)")
    }
    
    func session(session: WCSession, didReceiveUserInfo userInfo: [String : AnyObject]) {
        print("didReceiveUserInfo")
    }
    
    func sessionWatchStateDidChange(session: WCSession) {
        print("sessionWatchStateDidChange")
    }
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        parseData(applicationContext)
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        tableData.removeAtIndex(rowIndex)
        configureTable()
    }

    override func willActivate() {
        super.willActivate()
        let dict = session.receivedApplicationContext
        parseData(dict)
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    private func parseData(dict: [String : AnyObject]) {
        if let data = dict["todos"] as? [AnyObject] {
            print("Todos: \(data)")
            
            tableData = data.map({ (elem) -> Todo in
                let title = elem["title"] as? String ?? "failed to parse"
                let date = elem["date"] as? NSDate ?? NSDate()
                return Todo(title: title, date: date)
            })
            configureTable()
        }
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
