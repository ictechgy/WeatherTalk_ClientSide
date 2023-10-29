//
//  WeatherTalkApp.swift
//  WeatherTalk
//
//  Created by Coden on 2023/08/09.
//

import SwiftUI
import ComposableArchitecture

// MARK: - Coordinator

final class AppCoordinator: Coordinator {
    let store: StoreOf<AppReducer>
    let navigationController: UINavigationController = UINavigationController()
    private(set) var children: [any Coordinator]
    
    init(store: StoreOf<AppReducer>, children: [any Coordinator] = []) {
        self.store = store
        self.children = children
    }
    
    func makeMainView() -> some View {
        let listView = FriendListView(
            store: .init(initialState: FriendListCore.State(friendList: .init()), reducer: {
                FriendListCore()
            }),
            coordinator: makeListCoordinator()
        )
        return NavigationControllerView(rootView: listView, navigationController: navigationController)
    }
    
    private func makeListCoordinator() -> FriendListCoordinator {
        FriendListCoordinator(store: .init(initialState: FriendListCore.State(friendList: .init()), reducer: {
            FriendListCore()
        }), navigationController: self.navigationController)
    }
}

struct NavigationControllerView<RootContent: View>: UIViewControllerRepresentable {
    let rootView: RootContent
    let navigationController: UINavigationController
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let rootHostingViewController = UIHostingController(rootView: rootView)
        navigationController.viewControllers = [rootHostingViewController]
        
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) { }
}

// MARK: - Feature Domain

struct AppReducer: Reducer {
    struct State: Equatable {
    }
    
    enum Action {
        
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        .none
    }
}


// MARK: - Feature View

@main
struct WeaterTalkApp: App {
    private let appCoordinator = AppCoordinator(
        store: Store(
            initialState: AppReducer.State(),
            reducer: {
                AppReducer()
            }
        )
    )
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.makeMainView()
        }
    }
}
