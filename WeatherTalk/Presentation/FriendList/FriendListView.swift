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
        var friendList: IdentifiedArrayOf<[User]>
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
        List {
            ForEachStore(self.store) { store in
                FriendCellView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coordinator: ContentCoordinator(navigationController: UINavigationController()))
    }
}

final class ContentCoordinator: Coordinator {
    let navigationController: UINavigationController
    private(set) var children: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toDetailView() {
        navigationController.pushViewController(makeDetailView(), animated: true)
    }
    
    private func makeDetailView() -> UIViewController {
        let detailView = DetailView(coordinator: makeDetailCoordinator())
        let detailHostingViewController = UIHostingController(rootView: detailView)
        
        return detailHostingViewController
    }
    
    private func makeDetailCoordinator() -> DetailCoordinator {
        DetailCoordinator(navigationController: navigationController)
    }
}
