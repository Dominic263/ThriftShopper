//
//  StepperView.swift
//
//  Created by DOMINIC NDONDO on 2/14/24.
//

import SwiftUI

public struct StepperView: View {
    @Binding var value: Int
    
    public init(value: Binding<Int>) {
        self._value = value
    }
    
    public var body: some View {
        VStack {
            HStack{
                HStack{
                    Button(
                        action: {
                        self.value += 1
                        if value <= -1 {
                            value = 0
                        }
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(.borderless)
                }
                .frame(width: 30, height: 30)
                .background(.mint)
                .cornerRadius(5.0)
                
                HStack {
                    Button(
                        action: {
                            self.value += -1
                            if value <= -1 {
                                value = 0
                            }
                        }
                    ) {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(.borderless)
                }
                .frame(width: 30, height: 30)
                .background(.mint)
                .cornerRadius(5.0)
                
            }
        }
    }
}

struct StepperView_Previews: PreviewProvider {
    
    struct TestPreview: View {
        @State private var value = 2
        var body: some View {
            StepperView(value: $value)
        }
    }
    
    static var previews: some View {
        TestPreview()
    }
    
}
