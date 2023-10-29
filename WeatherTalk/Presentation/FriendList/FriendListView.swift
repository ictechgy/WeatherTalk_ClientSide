//
//  FriendListView.swift
//  WeaterTalk
//
//  Created by Coden on 2023/08/09.
//

import SwiftUI
import ComposableArchitecture

// MARK: - Coordinator

final class FriendListCoordinator: Coordinator {
    let store: StoreOf<FriendListCore>
    let navigationController: UINavigationController
    private(set) var children: [any Coordinator] = []
    
    init(store: StoreOf<FriendListCore>, navigationController: UINavigationController) {
        self.store = store
        self.navigationController = navigationController
    }
    
    func toDetailView() {
//        navigationController.pushViewController(makeDetailView(), animated: true)
    }
}

extension FriendListCoordinator {
//    private func makeDetailView() -> UIViewController {
//        let detailView = DetailView(store: self.store, coordinator: makeDetailCoordinator())
//        let detailHostingViewController = UIHostingController(rootView: detailView)
//
//        return detailHostingViewController
//    }
//
//    private func makeDetailCoordinator() -> DetailCoordinator {
//        DetailCoordinator(store: self.store, navigationController: navigationController)
//    }
}

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
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .viewOnAppear:
            break
        case .friendTapped:
            break
        case .addFriend:
            break
        case .cellAction:
            break
        }
        return .none
    }
}

// MARK: - Feature View

struct FriendListView: View {
    let store: StoreOf<FriendListCore>
    let coordinator: FriendListCoordinator
    
    var body: some View {
        WithViewStore(self.store) { $0 } content: { viewStore in
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
        
        return FriendListView(
            store: store,
            coordinator: .init(
                store: store,
                navigationController: UINavigationController()
            )
        )
    }
}
