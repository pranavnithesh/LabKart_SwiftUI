//
//  BundleExtension.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in the bundle")
        }
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) in the bundle")
        }
        // 3. crerate a decoder
        let decoder = JSONDecoder()
        // 4.  Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(file) in the bundle")
        }
        // 5. return the ready-to-use data
        return loaded
    }
}
