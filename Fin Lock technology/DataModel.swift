//
//  DataModel.swift
//  Fin Lock technology
//
//  Created by Sneh on 15/10/23.
//

import Foundation

// MARK: - PurpleData
struct DataModel: Codable {
    let error: Bool
    let msg: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let iso2: String
    let iso3, country: String
    let cities: [String] 
}

