//
//  WeatherTalkApp.swift
//  WeatherTalk
//
//  Created by Coden on 2023/08/09.
//

import SwiftUI

@main
struct WeaterTalkApp: App {
    private let appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.makeMainView()
        }
    }
}

final class AppCoordinator: Coordinator {
    let navigationController: UINavigationController = UINavigationController()
    private(set) var children: [Coordinator] = []
    
    func makeMainView() -> some View {
        let contentView = FriendListView(store: <#T##StoreOf<FriendListCore>#>, coordinator: makeContentCoordinator(navigationController: navigationController))
        return NavigationControllerView(rootView: contentView, navigationController: navigationController)
    }
    
    private func makeContentCoordinator(navigationController: UINavigationController) -> ContentCoordinator {
        ContentCoordinator(navigationController: navigationController)
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
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
}
