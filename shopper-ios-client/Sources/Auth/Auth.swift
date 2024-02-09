//
//  Auth.swift
//  Powers the registration and login routes 
//
//  Created by DOMINIC NDONDO on 2/8/24.
//
import Foundation
import ComposableArchitecture
import HTTP

public struct AuthFeature: Reducer {
    public struct State: Equatable {
        @BindingState public var username: String
        @BindingState public var password: String
        public var token: String
        public var userId: UUID?
        public var requestInFlight: Bool
        @PresentationState public var alert: AlertState<Action.Alert>?
        
        //TODO: create an init - the login feature is invoked if and only if we can read an auth token from user defaults
        public init(
            username: String = "",
            password: String = "",
            token: String = "",
            userId: UUID? = nil,
            requestInFlight: Bool = false
        ) {
            self.username = username
            self.password = password
            self.token = token
            self.userId = userId
            self.requestInFlight = requestInFlight
        }
    }
    
    public init()  {}
    
    @Dependency(\.httpClient) var httpClient
    @Dependency(\.continuousClock) var clock
    
    public enum Action: Equatable, BindableAction {
        case binding(BindingAction<State>)
        case loginButtonTapped
        case registerButtonTapped
        case alert(PresentationAction<Alert>)
        
        public enum Alert {
            case loginSuccess
            case registrationSuccess
            case failure
        }
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .loginButtonTapped:
                //TODO: handle the login route
                return .none
            case .registerButtonTapped:
                //TODO: handle the register route
                
                return .none
            case .alert(let alert):
                //TODO: run effects whenever alerts as come in regardless of the type of alert
                switch alert {
                case .dismiss:
                    return .none
                case .presented(_):
                    return .none
                }
            }
        }
        .ifLet(\.$alert, action: /Action.alert)
    }
}
