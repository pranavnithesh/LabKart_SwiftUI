//
//  BrandGridView.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import SwiftUI

struct BrandGridView: View {
    // MARK: - Properties
    @EnvironmentObject var shopViewModel: ShopViewModel
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, spacing: columnSpacing) {
                ForEach(shopViewModel.brands) { brand in
                    BrandItemView(brand: brand)
                } //: Loop
            } //: LazyHGrid
            .frame(height: 200)
            .padding(15)
        } //: Scroll
    }
}

// MARK: - Preview
struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
            .environmentObject(ShopViewModel())
            .previewLayout(.sizeThatFits)
    }
}

