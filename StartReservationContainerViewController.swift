//
//  StartReservationContainerViewController.swift
//  carpoolApp_v1.0
//
//  Created by Matt Hills on 6/7/16.
//  Copyright © 2016 Matthew Hills. All rights reserved.
//

import UIKit

class StartReservationContainerViewController: UITableViewController {
    
    var viewJustLaunched = true
    var cellTapped: Bool = true
    var locationCellTapped = false
    var dateCellTapped = false
    var timeCellTapped = false
    var aCellIsExpanded = false
    var currentRow = Int()
    
    var locationButtonForFormatting = UIButton()
    var selectedLocation = String()
    
    var selectedDate = NSDate()
    var dateFormatter = NSDateFormatter()

    var morningButtonSelected = Bool()
    var afternoonButtonSelected = Bool()
    var selectedIndex = Int()

//Choose location tableViewCell and dropdown outlet properties.
    @IBOutlet weak var chooseLocationLabel: UILabel!
    @IBOutlet weak var chooseLocationDisclosureIndicator: UIImageView!
    @IBOutlet weak var location1Button: UIButton!
    @IBOutlet weak var location2Button: UIButton!
    @IBOutlet weak var location3Button: UIButton!

//Choose date tableViewCell and dropdown outlet properties.
    @IBOutlet weak var chooseDateScrollView: UIScrollView!
    @IBOutlet weak var chooseDateDisclosureIndicator: UIImageView!

//Choose time tableViewCell and dropdown outlet properties.
    @IBOutlet weak var chooseTimeLabel: UILabel!
    @IBOutlet weak var chooseTimePicker: UIDatePicker!
    @IBOutlet weak var chooseTimeDisclosureIndicator: UIImageView!

    @IBAction func location1ButtonPressed(sender: AnyObject) {
        selectedLocation = (location1Button.titleLabel?.text)!
        updateChooseLocationLabel()
    }
    
    @IBAction func location2ButtonPressed(sender: AnyObject) {
        selectedLocation = (location2Button.titleLabel?.text)!
        updateChooseLocationLabel()
    }
    
    @IBAction func location3ButtonPressed(sender: AnyObject) {
        selectedLocation = (location3Button.titleLabel?.text)!
        updateChooseLocationLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsetsMake(-35, 0, -35, 0)
        chooseDateScrollView.contentSize.height = 690
        
        morningButtonSelected = true
        afternoonButtonSelected = false

        var imageView = UIImageView(frame: self.view.frame)
        var image = UIImage(named: "LoopLogoWhite")!
        imageView.image = image
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
        setLocationButtonProperties(location1Button)
        setLocationButtonProperties(location2Button)
        setLocationButtonProperties(location3Button)
        
        self.chooseTimePicker.setValue(UIColor.whiteColor(), forKey: "textColor")
        chooseTimePicker.addTarget(self, action: "timeChangedValue:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentRow = indexPath.row
        selectedCellIndex()
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if (indexPath.row == currentRow) {
            if (locationCellTapped == true) {
                chooseLocationDisclosureIndicator.transform = CGAffineTransformMakeScale(1, -1)
                return (view.frame.height) //- 44)
            } else if (dateCellTapped == true) {
                chooseDateDisclosureIndicator.transform = CGAffineTransformMakeScale(1, -1)
                return (view.frame.height) - 44 // - 88)
            } else if (timeCellTapped == true) {
                chooseTimeDisclosureIndicator.transform = CGAffineTransformMakeScale(1, -1)
                return (view.frame.height) - 88
            } else {
                chooseLocationDisclosureIndicator.transform = CGAffineTransformMakeScale(1, 1)
                chooseDateDisclosureIndicator.transform = CGAffineTransformMakeScale(1, 1)
                chooseTimeDisclosureIndicator.transform = CGAffineTransformMakeScale(1, 1)
                return 44
            }
        }
    return 44
        
    }

    func setLocationButtonProperties(locationButtonForFormatting: UIButton) {
        locationButtonForFormatting.layer.borderColor = UIColor.whiteColor().CGColor
        locationButtonForFormatting.layer.borderWidth = 1
        locationButtonForFormatting.layer.cornerRadius = 8
    }
    
    func updateChooseLocationLabel() {
        chooseLocationLabel.text = selectedLocation
        chooseLocationLabel.textColor = UIColor(red: 0/255, green: 51/255, blue: 0/255, alpha: 1.0)
    }
    
    func selectedCellIndex() {
        if (aCellIsExpanded == false) {
            if (currentRow == 0) {
                locationCellTapped = true
                dateCellTapped = false
                timeCellTapped = false
                aCellIsExpanded = true
            } else if (currentRow == 1) {
                locationCellTapped = false
                dateCellTapped = true
                timeCellTapped = false
                aCellIsExpanded = true
            } else if (currentRow == 2) {
                locationCellTapped = false
                dateCellTapped = false
                timeCellTapped = true
                aCellIsExpanded = true
            }
        } else {
            if (currentRow == 0) {
                locationCellTapped = false
                dateCellTapped = false
                timeCellTapped = false
                aCellIsExpanded = false
            } else if (currentRow == 1) {
                locationCellTapped = false
                dateCellTapped = false
                timeCellTapped = false
                aCellIsExpanded = false
            } else if (currentRow == 2) {
                locationCellTapped = false
                dateCellTapped = false
                timeCellTapped = false
                aCellIsExpanded = false
            }
        }
    }

    func timeChangedValue(date: NSDate) {
        selectedDate = chooseTimePicker.date
        dateFormatter.dateFormat = "HH:mm a"
        var convertedTime = dateFormatter.stringFromDate(selectedDate)
        chooseTimeLabel.text = "\(convertedTime)"
        chooseTimeLabel.textColor = UIColor(red: 0/255, green: 51/255, blue: 0/255, alpha: 1.0)

    }
    
}

extension NSLayoutConstraint {
    
    override public var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)"
    }
}
