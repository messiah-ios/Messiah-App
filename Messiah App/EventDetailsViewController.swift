//
//  EventDetailsViewController.swift
//  Messiah App
//
//  Created by Thomas Martin on 10/13/16.
//  Copyright © 2016 Thomas Martin. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    //<div>Font made from <a href="http://www.onlinewebfonts.com">oNline Web Fonts</a>is licensed by CC BY 3.0</div>
    @IBOutlet weak var v: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navbarTitle.title = ""

        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = v.backgroundColor
        self.navigationController?.navigationBar.barTintColor = v.backgroundColor
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.backBarButtonItem? = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
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
