//
//  Models.swift
//  iNetwork
//
//  Created by Mohammad on 2025-06-28.
//

import Foundation

struct IPModel: Codable {
    let ip: String
}

struct InfoModel: Codable {
    let ip: String?
    let country: String?
    let region: String?
    let city: String?
    let postal: String?
    let timezone: String?
    let isp: String?
    let org: String?
    let loc: String?
}

extension InfoModel {
    var asKeyValuePairs: [(key: String, value: String)] {
        [
            ("IP", ip ?? "N/A"),
            ("City", city ?? "N/A"),
            ("Region", region ?? "N/A"),
            ("Country", country ?? "N/A"),
            ("Location", loc ?? "N/A"),
            ("Organization", org ?? "N/A"),
            ("Postal", postal ?? "N/A"),
            ("Timezone", timezone ?? "N/A")
        ]
    }
}

// {
//  "ip": "45.144.29.129",
//  "city": "Amsterdam",
//  "region": "North Holland",
//  "country": "NL",
//  "loc": "52.3740,4.8897",
//  "org": "AS44477 PQ HOSTING PLUS S.R.L.",
//  "postal": "1012",
//  "timezone": "Europe/Amsterdam",
//  "readme": "https://ipinfo.io/missingauth"
// }

// "query": "24.48.0.1",
// "status": "success",
// "country": "Canada",
// "countryCode": "CA",
// "region": "QC",
// "regionName": "Quebec",
// "city": "Montreal",
// "zip": "H1L",
// "lat": 45.6026,
// "lon": -73.5167,
// "timezone": "America/Toronto",
// "isp": "Le Groupe Videotron Ltee",
// "org": "Videotron Ltee",
// "as": "AS5769 Videotron Ltee"
