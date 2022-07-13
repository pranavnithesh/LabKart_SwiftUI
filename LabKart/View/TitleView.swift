//
//  TitleView.swift
//  LabKart
//
//  Created by M1089943 on 23/06/22.
//

import SwiftUI

struct TitleView: View {
    // MARK: - Properties
    var title: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.accentColor)
                .fontWeight(.heavy)
            Spacer()
        } //: HStack
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
    }
}

// MARK: - Preview
struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Categories")
            .previewLayout(.sizeThatFits)
    }
}
