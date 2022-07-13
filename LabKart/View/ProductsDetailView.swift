//
//  ProductsDetailView.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import SwiftUI

struct ProductsDetailView: View {
    // MARK: - Properties
    @EnvironmentObject var shopViewModel: ShopViewModel
    @State private var isAnimating: Bool = false
    @State private var isShowingDetailView = false
    @Environment(\.presentationMode) var presentationMode
    let product: ProductViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 0) {
                    // IMAGE
                    Image("product-\(product.id)")
                        .resizable()
                        .frame(height: 300)
                        .scaledToFit()
                        .cornerRadius(15)
                        .padding(.top, 15)
                    
                    Group {
                        // TITLE
                        Text(product.title)
                            .font(.system(.largeTitle, design: .serif))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.accentColor)
                            .padding(.top, 10)
                        
                        // Price
                        Text(product.formattedPrice)
                            .font(.system(.title, design: .serif))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                        // RATING
                        HStack(spacing: 15) {
                            RatingView(product: product)
                            Text("\(Int(product.rating.count)) ratings")
                                .font(.system(.title, design: .serif))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                            Spacer()
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
                        } //: HStack
                        
                        // Description
                        Text(product.description)
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        Spacer()
                        Button {
                            feedback.impactOccurred()
                            shopViewModel.addToCart(product: product)
                            isShowingDetailView = true
                        } label: {
                            Spacer()
                            Text(shopViewModel.cartProducts.contains(where: { $0.id == product.id}) ? "Added!" : "Add To Cart".uppercased())
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                        } //: Button
                        .disabled(shopViewModel.cartProducts.contains(where: { $0.id == product.id}))
                        .padding(15)
                        .background(
                            shopViewModel.cartProducts.contains(where: { $0.id == product.id}) ? Color.gray : Color.accentColor
                        )
                        .clipShape(Capsule())
                    } //: Group
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                } //: VStack
            } //: Scroll
            NavigationLink(destination: CartView(), isActive: $isShowingDetailView) { EmptyView() }
        } //: VStack
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
struct ProductsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsDetailView(product: ShopViewModel().products[0])
            .environmentObject(ShopViewModel())
    }
}
