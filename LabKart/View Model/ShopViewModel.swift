//
//  ShopViewModel.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import Foundation
import SwiftUI

class ShopViewModel: ObservableObject {
    // MARK: - Properties
    @Published var showingCategory: Bool = false
    @Published var selectedCategory: String? = nil
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: ProductViewModel? = nil
    @Published var cartProducts: [ProductViewModel] = []
    @Published var wishListProducts: [ProductViewModel] = []
    @Published var total: Double = 0
    @Published var coverImages: [CoverImage] = []
    @Published var categoriesList: [CategoryItem] = []
    @Published var products: [ProductViewModel] = [ProductViewModel]()
    @Published var brands: [Brand] = []
    
    // MARK: - Functions
    // Add a product to the cart
    func addToCart(product: ProductViewModel) {
        if !cartProducts.contains(where: { $0.id == product.id }) {
            cartProducts.append(product)
            total += product.price
        }
    }
    
    // Remove a product to the cart
    func removeFromCart(product: ProductViewModel) {
        if let index = cartProducts.firstIndex(where: { $0.id == product.id }) {
            cartProducts.remove(at: index)
            total -= product.price
        }
    }
    
    // Add a product to the Wish List
    func addToWishList(product: ProductViewModel) {
        if !wishListProducts.contains(where: { $0.id == product.id }) {
            wishListProducts.append(product)
        }
    }
    
    // Remove a product to the Wish List
    func removeFromWishList(product: ProductViewModel) {
        if let index = wishListProducts.firstIndex(where: { $0.id == product.id }) {
            wishListProducts.remove(at: index)
        }
    }
    
    //Load Data
    
    func load() {
        getCoverImages()
        getCategoriesList()
        getProducts()
        getBrands()
    }
    
    // Cover Images
    func getCoverImages() {
        coverImages = Bundle.main.decode("Covers.json")
    }
    
    
    // Categories List
    func getCategoriesList() {
        categoriesList = Bundle.main.decode("Categories.json")
    }
    
    // Products
    func getProducts() {
        let productsList: [Product]? = Bundle.main.decode("Products.json")
        if let productsList = productsList {
            DispatchQueue.main.async {
                self.products = productsList.map(ProductViewModel.init)
            }
        }
    }
    
    // Brands
    func getBrands() {
        brands = Bundle.main.decode("Brands.json")
    }
}
