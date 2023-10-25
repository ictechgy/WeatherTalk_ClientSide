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
    let store: StoreOf<AppReducer>
    let navigationController: UINavigationController
    private(set) var children: [any Coordinator] = []
    
    init(store: StoreOf<AppReducer>, navigationController: UINavigationController) {
        self.store = store
        self.navigationController = navigationController
    }
    
    func toDetailView() {
        navigationController.pushViewController(makeDetailView(), animated: true)
    }
}

extension FriendListCoordinator {
    private func makeDetailView() -> UIViewController {
        let detailView = DetailView(store: self.store, coordinator: makeDetailCoordinator())
        let detailHostingViewController = UIHostingController(rootView: detailView)
        
        return detailHostingViewController
    }
    
    private func makeDetailCoordinator() -> DetailCoordinator {
        DetailCoordinator(store: self.store, navigationController: navigationController)
    }
}

// MARK: - Feature Domain

struct FriendListCore: Reducer {
    struct State: Equatable {
        var friendList: IdentifiedArrayOf<[User]>
        
        init(friendList: IdentifiedArrayOf<[User]>) {
            self.friendList = friendList
        }
    }
    
    enum Action {
        case viewOnAppear
        case friendTapped
        case addFriend
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .viewOnAppear:
            break
        case .friendTapped:
            break
        case .addFriend:
            break
        }
    }
}

// MARK: - Feature View

struct FriendListView: View {
    let store: StoreOf<FriendListCore>
    let coordinator: FriendListCoordinator
    
    var body: some View {
        WithViewStore(self.store) { $0 } content: { viewStore in
            List {
                ForEachStore(viewStore) { store in
//                    FriendCellView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coordinator: ContentCoordinator(navigationController: UINavigationController()))
    }
}
