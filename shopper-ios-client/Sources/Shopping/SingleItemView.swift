//
//  SingleListView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/16/24.
//

import SwiftUI

public struct SingleListView: View {
    public let title: String
    public let date: Date
    
    public var body: some View {
        HStack {
            VStack {
                HStack {
                    Circle()
                        .frame(width: 25)
                        
                    Text(title)
                        .padding(.horizontal)
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                HStack {
                    Text(dateFormatter.string(from: date))
                    Spacer()
                }
                .padding()
                
            }.padding()
            
        
            HStack {
                Image(systemName: "chevron.right")
            }
            .padding()
            
            Spacer()
        }
        .background(.mint)
        .cornerRadius(10)
        .edgesIgnoringSafeArea(.all)
        
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mma"
        return formatter
    }()
}


struct SingleItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleListView(title: "Stop and Shop Store Run", date: Date())
    }
}
