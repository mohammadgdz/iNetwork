//
//  Models.swift
//  iNetwork
//
//  Created by Mohammad on 2025-06-28.
//

import Foundation

struct IPModel:Codable {
    let ip:String
}

struct InfoModel:Codable {

    let query:String
    let status:String
    let country:String
    let countryCode:String
    let region:String
    let regionName:String
    let city:String
    let zip:String
    let lat:Double
    let lon:Double
    let timezone:String
    let isp:String
    let org:String
    let address:String
    
    enum CodingKeys: String, CodingKey {
        case query,status,country,countryCode,region,regionName,city,zip,lat,lon,timezone,isp,org
        case address = "as"
    }
    
}

//"query": "24.48.0.1",
//"status": "success",
//"country": "Canada",
//"countryCode": "CA",
//"region": "QC",
//"regionName": "Quebec",
//"city": "Montreal",
//"zip": "H1L",
//"lat": 45.6026,
//"lon": -73.5167,
//"timezone": "America/Toronto",
//"isp": "Le Groupe Videotron Ltee",
//"org": "Videotron Ltee",
//"as": "AS5769 Videotron Ltee"
