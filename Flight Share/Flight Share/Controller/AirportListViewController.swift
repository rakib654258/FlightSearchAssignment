//
//  AirportListViewController.swift
//  Flight Share
//
//  Created by macOS Mojave on 12/7/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import UIKit

//var airportInfo: [AirportList] = []

var airportListInfo: AirportLists? = nil
var airportName : [String] = []
var CityName : [String] = []
var CityCode: [String] = []

class AirportListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITabBarDelegate,UISearchBarDelegate {
    
    var senderButtonTag = 0
    var searching = false
    var filterArray: [String]?
    

    @IBOutlet weak var searchBarOutlet: UISearchBar!
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Flying From"
        readJson()
        // Do any additional setup after loading the view.
    }
    
    // read json file for Airport List
    private func readJson() {
        do {
            if let file = Bundle.main.url(forResource: "AirportList", withExtension: "json") {
                let data = try Data(contentsOf: file)
                do{
                    let myData = try JSONDecoder().decode(AirportLists.self, from: data)
                    //print("MyData Airport Name: ",myData.AirportList[3].Value)
                    airportListInfo = myData
                    let count = airportListInfo?.AirportList.count
                    //print(count)
                    for i in 0..<count!{
                        airportName.append((airportListInfo?.AirportList[i].Value)!)
                        if let city = airportListInfo?.AirportList[i].City{
                            CityName.append(city)
                        }
                        CityCode.append((airportListInfo?.AirportList[i].Code)!)
                    }
                    }
//
            } else {
                print("no file")
            }
        } catch {
            print("Error message: ",error.localizedDescription)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            let count = filterArray?.count
            return count!
        }else{
            let count = airportListInfo?.AirportList.count
            return count!
        }
        //return airportName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! customTableViewCell
        
        cell.airportLabel.text = "\(CityName[indexPath.row]),\(airportName[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userDefault = UserDefaults()
        if senderButtonTag == 1{
            userDefault.set(CityCode[indexPath.row], forKey: "depatureCityCode")
            userDefault.set(airportName[indexPath.row], forKey: "depatureAirportName")
            userDefault.set(CityName, forKey: "depatureCityName")
        }
        else if senderButtonTag == 2{
            userDefault.set(CityCode[indexPath.row], forKey: "arrivalCityCode")
            userDefault.set(airportName[indexPath.row], forKey: "arrivalAirportName")
            userDefault.set(CityName, forKey: "arrivalCityName")
        }
        
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searching = true
        if ((searchBar.text?.isEmpty)!){
            filterArray = CityName
            //filterArray?.append(airportName)
        }else{
            self.filterArray = CityName.filter({ $0.lowercased().contains(searchBar.text!.lowercased())})
        }
        self.tableViewOutlet.reloadData()
    }
    
    

}
