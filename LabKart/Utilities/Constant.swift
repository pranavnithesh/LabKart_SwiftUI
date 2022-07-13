//
//  Constant.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import SwiftUI

// LAYOUT
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
// UX
let feedback = UIImpactFeedbackGenerator(style: .medium)
