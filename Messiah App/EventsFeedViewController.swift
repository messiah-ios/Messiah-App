//
//  EventsFeedViewController.swift
//  Messiah App
//
//  Created by Thomas Martin on 2/8/17.
//  Copyright © 2017 Thomas Martin. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EventsFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        
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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateEvents (today: Int) {
        let ref: FIRDatabaseReference = FIRDatabase.database().reference().child("Events")
        
        ref.queryOrdered(byChild: "millitime").queryEnding(atValue: today).observeSingleEvent(of: .value, with: {(snapshot) in
            
            print(snapshot)
            
            for a in snapshot.children {
                let val = (a as! FIRDataSnapshot).value as? NSDictionary
                let name = (val?["name"] as? String ?? "")
                let time = (val?["datetime"] as? String ?? "")
                let loc = (val?["location"] as? String ?? "")
                print("The name is \(name)")
                eventArr.append(Event(t: name, d: time, l: loc))
            }
            
            self.tableview.reloadData()
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(eventArr.count)
        return eventArr.count //contacts.count
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cell: EventCell = tableview.dequeueReusableCell(withIdentifier: "Cell2") as! EventCell
    
        let event: Event = eventArr[(indexPath as NSIndexPath).row]
        cell.setTime(time: event.date, location: event.location)
        cell.setTitle(title:  event.title)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
