//
//  ProductsListView.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import SwiftUI

struct ProductsListView: View {
    // MARK: - Properties
    @EnvironmentObject var shopViewModel: ShopViewModel
    @State private var showCart = false
    let productsList: [ProductViewModel]
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVGrid(columns: gridLayout, spacing: 15) {
                    ForEach(productsList, id: \.self.id) { product in
                        NavigationLink {
                            ProductsDetailView(product: product)
                        } label: {
                            ProductsItemView(product: product)
                        } //: Link
                    } //: Loop
                } //: LazyVGrid
            }) //: Scroll
            .listStyle(.grouped)
            .padding(15)
            .navigationTitle(shopViewModel.selectedCategory?.capitalized ?? shopViewModel.products[0].category.capitalized)
            .navigationBarTitleDisplayMode(.inline)
            .background(
                NavigationLink(destination: CartView(), isActive: $showCart) {
                    EmptyView()
                }
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        feedback.impactOccurred()
                        withAnimation(.easeIn) {
                            shopViewModel.selectedCategory = nil
                            shopViewModel.showingCategory = false
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.accentColor)
                    } //: BUTTON
                } //: Toolbar Item
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
                                } //: Gesture
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
    }
}

// MARK: - Preview
struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(productsList: ShopViewModel().products)
            .environmentObject(ShopViewModel())
    }
}
