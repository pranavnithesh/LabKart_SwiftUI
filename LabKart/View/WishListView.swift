//
//  WishListView.swift
//  LabKart
//
//  Created by M1089943 on 24/06/22.
//

import SwiftUI

struct WishListView: View {
    // MARK: - Properties
    @EnvironmentObject var shopViewModel: ShopViewModel
    @State private var showCart = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            if shopViewModel.wishListProducts.count > 0 {
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVGrid(columns: gridLayout, spacing: 15) {
                        ForEach(shopViewModel.wishListProducts, id: \.self.id) { product in
                            NavigationLink {
                                ProductsDetailView(product: product)
                            } label: {
                                WishListItemView(product: product)
                            } //: Link
                        } //: Loop
                    } //: LaxyVGrid
                }) //: Scroll
                .listStyle(.grouped)
                .padding(15)
                .navigationTitle("WishList")
                .navigationBarTitleDisplayMode(.inline)
                .background(
                    NavigationLink(destination: CartView(), isActive: $showCart) {
                        EmptyView()
                    }
                )
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            feedback.impactOccurred()
                        } label: {
                            ZStack {
                                Image(systemName: "cart")
                                    .font(.title)
                                    .foregroundColor(.accentColor)
                                    .onTapGesture {
                                        feedback.impactOccurred()
                                        showCart = true
                                    }
                                if shopViewModel.cartProducts.count > 0 {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 14, height: 14, alignment: .center)
                                        .offset(x: 13, y: -10)
                                }
                            } //: ZSTACK
                        } //: BUTTON
                    } //: Toolbar Item
                } //: Toolbar
            } else {
                Spacer()
                Text("No Items in WishList!!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                Text("Add Items to Wish List")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.accentColor)
                Spacer()
            }
        } //: VStack
    }
}

// MARK: - Preview
struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
    }
}
