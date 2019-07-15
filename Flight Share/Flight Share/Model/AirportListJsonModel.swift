//
//  AirportListJsonModel.swift
//  Flight Share
//
//  Created by macOS Mojave on 15/7/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import Foundation

struct AirportLists: Decodable {
    let AirportList: [airportList]
}

struct airportList: Decodable {
    let Code: String? //ANW
    let Value: String?
    let City: String?
    //let Country: String
    //let Latitude: String
    //let Longitude: String
}
