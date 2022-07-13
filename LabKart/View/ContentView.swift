//
//  ContentView.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @EnvironmentObject var shopViewModel: ShopViewModel
    @State private var showCart = false
    @State private var showWishList = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            if shopViewModel.showingCategory == false {
                NavigationView {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        TitleView(title: "Categories")
                        LazyVGrid(columns: gridLayout, spacing: 15) {
                            ForEach(shopViewModel.categoriesList) { item in
                                CategoryView(category: item.name)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        feedback.impactOccurred()
                                        withAnimation(.easeOut) {
                                            shopViewModel.showingCategory = true
                                            shopViewModel.selectedCategory = item.name
                                        } //: Animation
                                    } //: Gesture
                            } //: Loop
                        } //: Grid
                        .padding(5)
                        TitleView(title: "Brands")
                        BrandGridView()
                        FooterView()
                            .padding(.horizontal)
                        
                    } //: List
                    .navigationTitle("Lab Kart")
                    .navigationBarTitleDisplayMode(.large)
                    .background(
                        NavigationLink(destination: CartView(), isActive: $showCart) {
                            EmptyView()
                        }
                    )
                    .background(
                        NavigationLink(destination: WishListView(), isActive: $showWishList) {
                            EmptyView()
                        }
                    )
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                feedback.impactOccurred()
                                showWishList = true
                            } label: {
                                Image(systemName: "heart")
                                    .font(.headline)
                                    .foregroundColor(.accentColor)
                            } //: BUTTON
                        } //: Toolbar Item
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                feedback.impactOccurred()
                                showCart = true
                            } label: {
                                ZStack {
                                    Image(systemName: "cart")
                                        .font(.headline)
                                        .foregroundColor(.accentColor)
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
                } //: Navigation
            } else {
                let productsList = shopViewModel.products.filter { product in
                    return product.category.lowercased() == shopViewModel.selectedCategory?.lowercased()
                }
                ProductsListView(productsList: productsList)
            }
        } //: ZStack
        .onAppear(perform: {
            shopViewModel.load()
        })
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ShopViewModel())
    }
}
