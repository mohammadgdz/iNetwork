//
//  Models.swift
//  iNetwork
//
//  Created by Mohammad on 2025-06-28.
//

import Foundation

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

