//
//  EventCell.swift
//  Messiah App
//
//  Created by Thomas Martin on 2/9/17.
//  Copyright © 2017 Thomas Martin. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTitle(title: String) {
        titleLabel.text = title
    }

    func setTime(time: String, location: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
        //dateFormatter.timeZone = NSTimeZone(name: "UTC")
        let date = dateFormatter.date(from: time)
        
        // change to a readable time format and change to local time zone
        dateFormatter.dateFormat = "hh:mm"
        //dateFormatter.timeZone = NSTimeZone.localTimeZone()
        let timeStamp = dateFormatter.string(from: date!)
        
        timeLabel.text = "\(location) at \(timeStamp)"
    }
}
