//
//  Calendar.swift
//  
//
//  Created by DOMINIC NDONDO on 2/13/24.
//
import ComposableArchitecture
import Foundation

public struct CalendarFeature: Reducer {
    
    public init(){}
    
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action: Equatable {
        
    }
    
    public var body: some ReducerOf<Self>{
        Reduce { state, action in
            switch action {
                
            }
        }
    }
}
