//  LoginView.swift
//
//  Created by DOMINIC NDONDO on 2/8/24.
import SwiftUI
import ComposableArchitecture

public struct AuthView: View {
    
    public var store: StoreOf<AuthFeature>
    
    public init(store: StoreOf<AuthFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Color.gray.opacity(0.2).ignoresSafeArea()
                
                if (viewStore.requestInFlight) {
                    ProgressView()
                }
                
                VStack {
                    Spacer()
                    TextField("Username", text: viewStore.$username)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(.roundedBorder)
                        .frame(height: 40)
                    
                    SecureField("Password", text: viewStore.$password)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(.roundedBorder)
                        .frame(height: 40)
                    
                    HStack {
                        // change the login or registration button depending on token existence.
                        if ( viewStore.token.isEmpty) {
                            //Registration Button
                            Button(action : { viewStore.send(.registerButtonTapped)}) {
                                Text("Register")
                            }
                            .tint(.mint)
                            .buttonStyle(.borderedProminent)
                        } else  {
                            //Login Button
                            Button(action : { viewStore.send(.loginButtonTapped)}) {
                                Text("Login")
                            }
                            .tint(.mint)
                            .buttonStyle(.borderedProminent)
                        }
                        
                    }
                    Spacer()
                }.padding()
            }
            .alert(store: self.store.scope(state: \.$alert, action: { .alert($0) }))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(
            store: Store(
                initialState: AuthFeature.State(),
                reducer: {
                    AuthFeature()
                })
        )
    }
}
