//
//  RatingView.swift
//  LabKart
//
//  Created by M1089943 on 24/06/22.
//

import SwiftUI

struct RatingView: View {
    // MARK: - PROPERTIES
    let product: ProductViewModel
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1...Int(round(product.rating.rate)), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(Color.yellow)
            } //: Loop
        } //: HStack
    }
}

// MARK: - Preview
struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(product: ShopViewModel().products[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
