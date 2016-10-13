//
//  Table.swift
//  Messiah App
//
//  Created by Thomas Martin on 10/6/16.
//  Copyright © 2016 Thomas Martin. All rights reserved.
//

import UIKit
var currentEvent: Event? = nil

class Table: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("On table view")
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
