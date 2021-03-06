//
//  Table.swift
//  Messiah App
//
//  Created by Thomas Martin on 10/6/16.
//  Copyright © 2016 Thomas Martin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

var currentEvent: Event? = nil

class Table: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("On table view")
        
        let date = Date()
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let day = calendar.component(.day, from: date)
        
        let components = DateComponents(calendar: calendar, year: year, month: month, day: day)
        let date2 = calendar.date(from: components)
        print("The time is")
        print(date2?.timeIntervalSince1970)
        populateEvents(today: Int((date2?.timeIntervalSince1970)!))
    }
    
    func populateEvents (today: Int) {
        let ref: FIRDatabaseReference = FIRDatabase.database().reference().child("Events")
        
        ref.queryOrdered(byChild: "millitime").queryEnding(atValue: today).observeSingleEvent(of: .value, with: {(snapshot) in
            
            print(snapshot)
            
            for a in snapshot.children {
                let val = (a as! FIRDataSnapshot).value as? NSDictionary
                let name = (val?["name"] as? String ?? "")
                let time = (val?["datetime"] as? String ?? "")
                print("The name is \(name)")
                //eventArr.append(Event(t: name, d: time))
            }
            
            self.tableView.reloadData()
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(eventArr.count)
        return eventArr.count //contacts.count
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        
        //currentContact = (indexPath as NSIndexPath).row
        //print(contacts[currentContact])
        
        currentEvent = eventArr[indexPath.row]
        self.performSegue(withIdentifier: "eventSegue", sender: self)
        
        return indexPath
        
    }
    
    /*override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        
    }*/
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = eventArr[(indexPath as NSIndexPath).row].title
        print(eventArr[(indexPath as NSIndexPath).row].title)
        
        return cell
    }
    
}
