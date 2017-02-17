//
//  ViewController.swift
//  Messiah App
//
//  Created by Thomas Martin on 10/6/16.
//  Copyright © 2016 Thomas Martin. All rights reserved.
//

import UIKit

var eventArr:[Event] = [Event]()
var firstTime:Bool = true

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if firstTime {
            initFakeEvents()
            firstTime = false
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func initFakeEvents () {
        //eventArr.append(Event(t:"iOS Dev Meeting", d:"10/13/2016"))
        //eventArr.append(Event(t:"Pizza Day", d:"10/13/2016"))
        //eventArr.append(Event(t:"Running home", d:"10/13/2016"))
    }
}

