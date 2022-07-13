//
//  CartView.swift
//  LabKart
//
//  Created by M1089943 on 24/06/22.
//

import SwiftUI

struct CartView: View {
    // MARK: - Properties
    @EnvironmentObject var shopViewModel: ShopViewModel
    @State private var isSharePresented: Bool = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            if shopViewModel.cartProducts.count > 0 {
                List {
                    ForEach(shopViewModel.cartProducts, id: \.self.id) { product in
                        HStack(alignment: .center, spacing: 16) {
                            Image("product-\(product.id)")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 90, height: 90)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 12)
                                )
                            VStack(alignment: .leading, spacing: 8) {
                                Text(product.title)
                                    .font(.title2)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.accentColor)
                                    .lineLimit(2)
                                
                                Text(product.formattedPrice)
                                    .font(.footnote)
                                    .foregroundColor(.white)
                            } //: VSTACK
                            Spacer()
                            Button {
                                feedback.impactOccurred()
                                shopViewModel.removeFromCart(product: product)
                            } label: {
                                Image(systemName: "trash.fill")
                                    .foregroundColor(.accentColor)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                            } //: Button
                        } //: HStack
                    } //: Loop
                } //: List
                GroupBox() {
                    HStack {
                        Text("Total Amount")
                        Spacer()
                        Text("₹\(String(format: "%.2f", shopViewModel.total))")
                    } //: HStack
                    .font(.title2)
                    Divider()
                    HStack {
                        Button("Share Details") {
                            feedback.impactOccurred()
                            self.isSharePresented = true
                        } //: Button
                        .sheet(isPresented: $isSharePresented, onDismiss: {
                            print("Dismiss")
                        }, content: {
                            ActivityViewController(activityItems: [URL(string: "https://www.apple.com")!])
                        })
                    } //: HStack
                    .font(.title2)
                } //: Box
            } else {
                Spacer()
                Image(systemName: "cart")
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                    .foregroundColor(.accentColor)
                Text("Cart is Empty..!!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                Spacer()
            } //: HSTACK
        } //: VStack
        .navigationTitle("Cart")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ShopViewModel())
    }
}
