//
//  EventDetailsViewController.swift
//  Messiah App
//
//  Created by Thomas Martin on 10/13/16.
//  Copyright © 2016 Thomas Martin. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var event: UILabel!
    @IBOutlet weak var host: UILabel!
    @IBOutlet weak var datetime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datetime.text = currentEvent?.date
        event.text = currentEvent?.title
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
