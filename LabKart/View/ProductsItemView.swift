//
//  ProductsItemView.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import SwiftUI

struct ProductsItemView: View {
    // MARK: - Properties
    @EnvironmentObject var shopViewModel: ShopViewModel
    let product: ProductViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Photo
            VStack {
                ZStack {
                    Image("product-\(product.id)")
                        .resizable()
                        .frame(height: 200)
                        .scaledToFit()
                        .padding(10)
                } //: ZStack
                .background(Color.white)
                .cornerRadius(12)
                // Name
                Text(product.title)
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundColor(.accentColor)
                    .lineLimit(2)
                // Price
                Text(product.formattedPrice)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            } //: VStack
            
            HStack {
                Image(systemName: shopViewModel.wishListProducts.contains(where: { $0.id == product.id}) ? "heart.fill" : "heart")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        feedback.impactOccurred()
                        if shopViewModel.wishListProducts.contains(where: { $0.id == product.id}) {
                            shopViewModel.removeFromWishList(product: product)
                        } else {
                            shopViewModel.addToWishList(product: product)
                        }
                    } //: Gesture
                Spacer()
                Image(systemName: shopViewModel.cartProducts.contains(where: { $0.id == product.id }) ? "cart.fill" : "cart")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        feedback.impactOccurred()
                        if shopViewModel.cartProducts.contains(where: { $0.id == product.id}) {
                            shopViewModel.removeFromCart(product: product)
                        } else {
                            shopViewModel.addToCart(product: product)
                        }
                    } //: Gesture
            } //: HStack
        } //: VStack
    }
}

// MARK: - Preview
struct ProductsItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsItemView(product: ShopViewModel().products[0])
            .environmentObject(ShopViewModel())
            .padding()
    }
}
