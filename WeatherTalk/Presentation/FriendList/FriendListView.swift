//
//  FriendListView.swift
//  WeaterTalk
//
//  Created by Coden on 2023/08/09.
//

import SwiftUI
import ComposableArchitecture

// MARK: - Feature Domain

struct FriendListCore: Reducer {
    struct State: Equatable {
        var friendList: IdentifiedArrayOf<FriendCellCore.State>
    }
    
    enum Action {
        case viewOnAppear
        case friendTapped
        case addFriend
        case cellAction(id: FriendCellCore.State.ID, action: FriendCellCore.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
        .forEach(\.friendList, action: /Action.cellAction(id:action:)) {
            FriendCellCore()
        }
    }
}

// MARK: - Feature View

struct FriendListView: View {
    let store: StoreOf<FriendListCore>
    
    var body: some View {
        WithViewStore(self.store) { $0 } content: { viewStore in
            NavigationStack {
                List {
                    ForEachStore(
                        self.store.scope(state: \.friendList, action: { .cellAction(id: $0, action: $1) })
                    ) {
                        
                        FriendCellView(store: $0)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(
            initialState: .init(
                friendList: .init()
            ),
            reducer: {
                FriendListCore()
            }
        )
        
        return FriendListView(store: store)
    }
}
