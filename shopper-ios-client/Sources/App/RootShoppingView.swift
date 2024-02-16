//
//  RootShoppingView.swift
//  Manages the Path Reducer and helps with any drill down navigation happening on the root of the shopping List Feature
//
//  Created by DOMINIC NDONDO on 2/16/24.
//

import SwiftUI

public struct RootShoppingView: View {
    public var body: some View {
        NavigationStack {
            List {
                ForEach(0..<6) { _ in
                    
                    HStack {
                        VStack {
                            HStack {
                                Circle()
                                    .frame(width: 25)
                                    
                                Text("Stop and Shop")
                                    .padding(.horizontal)
                                Spacer()
                            }
                            
                            Spacer()
                            
                            HStack {
                                Text(dateFormatter.string(from: Date()))
                                Spacer()
                            }
                            
                        }
                        .padding()
                    
                        HStack {
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        Spacer()
                    }
                    .background(.mint)
                    .cornerRadius(10)
                }
                
            }
            .navigationTitle("Grocery Lists")
            .toolbar {
                ToolbarItem {
                    //TODO: Implement the action that goes here
                    Button(action: {}){
                        Image(systemName: "plus")
                    }
                }
            }
            .listStyle(.plain)
            
        }
    }
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, h:mma"
            return formatter
    }()
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RootShoppingView()
    }
}
