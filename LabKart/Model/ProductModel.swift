//
//  ProductModel.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Ratings
}

struct Ratings: Codable {
    let rate: Double
    let count: Double
}
