//
//  WeatherTalkApp.swift
//  WeatherTalk
//
//  Created by Coden on 2023/08/09.
//

import SwiftUI
import ComposableArchitecture

@main
struct WeaterTalkApp: App {
    var body: some Scene {
        WindowGroup {
            FriendListView(
                store: Store(
                    initialState: FriendListCore.State(friendList: []),
                    reducer: {
                        FriendListCore()
                    }
                )
            )
        }
    }
}
