//
//  TotalView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/15/24.
//

import SwiftUI

public struct TotalView: View {
    @Binding public var total: Double
    
    public var body: some View {
        VStack {
            HStack {
                Text("TOTAL")
                    .font(.custom("Roboto", size: 20))
                    .padding(.leading)
                Spacer()
                
                Text("\(total.formatted(.currency(code: "USD")))")
                    .font(.custom("Roboto", size: 20))
                    .padding(.trailing)
                    
            }
        }
    }
}

struct TotalView_Previews: PreviewProvider {
    struct Test: View {
        var body: some View {
            TotalView(total: .constant(3.55))
        }
    }
    
    static var previews: some View {
        Test()
    }
}
