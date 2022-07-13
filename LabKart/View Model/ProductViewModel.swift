//
//  ProductViewModel.swift
//  LabKart
//
//  Created by M1089943 on 27/06/22.
//

import Foundation

struct ProductViewModel {
    let product: Product
    
    var id: Int {
        return self.product.id
    }
    
    var title: String {
        return self.product.title
    }

    var description: String {
        return self.product.description
    }
    
    var price: Double {
        return self.product.price
    }
    
    var category: String {
        return self.product.category
    }
    
    var image: String {
        return self.product.image
    }

    var formattedPrice: String {
        return "₹\(self.product.price)"
    }
    
    var rating: Ratings {
        return self.product.rating
    }
}
