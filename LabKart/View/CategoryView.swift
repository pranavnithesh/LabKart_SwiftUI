//
//  CategoryView.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import SwiftUI

struct CategoryView: View {
    // MARK: - Properties
    let category: String
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            // Photo
            ZStack {
                Image(category)
                    .frame(width: 120, height: 120, alignment: .center)
                    .scaledToFit()
                    .padding(5)
            } //: ZStack
            .cornerRadius(12)
            // Name
            Text(category)
                .font(.title3)
                .foregroundColor(.accentColor)
                .fontWeight(.black)
        } //: VStack
    }
}

// MARK: - Preview
struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: "cover-1")
            .previewLayout(.fixed(width: 200, height: 300))
            .padding()
    }
}
