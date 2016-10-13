//
//  UnionView.swift
//  Messiah App
//
//  Created by Thomas Martin on 10/6/16.
//  Copyright © 2016 Thomas Martin. All rights reserved.
//

import UIKit

class UnionView: UIViewController {

    @IBOutlet weak var web: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url: URL = URL(string: "union.messiah.edu")!
        let request: URLRequest = URLRequest(url: url)
        web.loadRequest(request)
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
