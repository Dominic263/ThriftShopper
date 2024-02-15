//
//  PickerView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/14/24.
//

import SwiftUI

public struct PickerView: View {
    @Binding public var selection: Int
    
    public init(selection: Binding<Int>) {
        self._selection = selection
    }
    public var body: some View {
        Picker("Qnty", selection: $selection) {
            ForEach(0..<1000) { num in
                Text(String(num))
            }
        }
        .pickerStyle(WheelPickerStyle())
    }
}

struct PickerView_Previews: PreviewProvider {
    
    struct TestPickerView: View {
        @State private var value = 2
        var body: some View {
            PickerView(selection: $value)
        }
    }
    
    static var previews: some View {
        TestPickerView()
    }
}
