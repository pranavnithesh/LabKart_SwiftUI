//
//  BrandItemView.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import SwiftUI

struct BrandItemView: View {
    // MARK: - Properties
    @EnvironmentObject var shopViewModel: ShopViewModel
    let brand: Brand
    
    // MARK: - Body
    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit()
            .padding(3)
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

// MARK: - Preview
struct BrandItemView_Previews: PreviewProvider {
    static var previews: some View {
        BrandItemView(brand: ShopViewModel().brands[0])
            .environmentObject(ShopViewModel())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

