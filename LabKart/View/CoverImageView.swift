//
//  CoverImageView.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - Properties
    @EnvironmentObject var shopViewModel: ShopViewModel
    
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(shopViewModel.coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill ()
            } //: Loop
        } //: TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: - Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .environmentObject(ShopViewModel())
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
