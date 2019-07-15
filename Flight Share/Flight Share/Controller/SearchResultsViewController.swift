//
//  SearchResultsViewController.swift
//  Flight Share
//
//  Created by macOS Mojave on 12/7/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {

    @IBOutlet weak var headerFromToLabel: UILabel!
    @IBOutlet weak var headerDateTravellerLabel: UILabel!
    @IBOutlet weak var airlineNameLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var fromCityLabel: UILabel!
    @IBOutlet weak var toCityLabel: UILabel!
    @IBOutlet weak var fromTimeLbl: UILabel!
    @IBOutlet weak var toTimeLbl: UILabel!
    @IBOutlet weak var stopLabel: UILabel!
    @IBOutlet weak var flightDurationLabel: UILabel!
    @IBOutlet weak var returnFromCityLbl: UILabel!
    @IBOutlet weak var returnToCityLbl: UILabel!
    @IBOutlet weak var retunFromTimeLbl: UILabel!
    @IBOutlet weak var returnToTimeLbl: UILabel!
    @IBOutlet weak var returnFlightDurationLbl: UILabel!
    @IBOutlet weak var returnStopLbl: UILabel!
    
    var fromCity = ""
    var toCity = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        let userDefault = UserDefaults()
        
        if let data = userDefault.object(forKey: "seatRequested"){
            if let dataString = data as? Int{
                self.headerDateTravellerLabel.text = "Date,\(dataString) Traveller"
            }
        }
//        if let data = userDefault.object(forKey: "airlineName"){
//            if let dataString = data as? String{
//                self.airlineNameLabel.text = dataString
//            }
//        }
        if let data = userDefault.object(forKey: "fromAirport"){
            if let dataString = data as? String{
                self.fromCityLabel.text = dataString
                self.returnFromCityLbl.text = dataString
                fromCity = dataString
            }
        }
        if let data = userDefault.object(forKey: "toAirport"){
            if let dataString = data as? String{
                self.toCityLabel.text = dataString
                self.returnToCityLbl.text = dataString
                toCity = dataString
            }
        }
        if let data = userDefault.object(forKey: "currency"){
            if let dataString = data as? String{
                self.currencyLabel.text = dataString
            }
        }
//        if let data = userDefault.object(forKey: "journeyDuration"){
//            if let dataString = data as? String{
//                self.flightDurationLabel.text = dataString
//            }
//        }
//        if let data = userDefault.object(forKey: "stop"){
//            if let dataString = data as? String{
//                self.stopLabel.text = dataString
//            }
//        }
//        if let data = userDefault.object(forKey: "price"){
//            if let dataString = data as? String{
//                self.priceLabel.text = dataString
//            }
//        }
        self.headerFromToLabel.text = "\(fromCity)->\(toCity)->\(fromCity)"
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
}
