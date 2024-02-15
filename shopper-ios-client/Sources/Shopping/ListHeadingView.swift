//
//  ListHeadingView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/15/24.
//

import SwiftUI

struct ListHeadingView: View {
    var body: some View {
        HStack {
            Text("ITEM")
                .padding(.leading)
                .font(.headline)
            Spacer()
            Text("PRICE")
                .padding(.leading)
                .font(.headline)
            Spacer()
            Text("TOTAL")
                .font(.headline)
                .padding(.trailing)
        }
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeadingView()
    }
}
