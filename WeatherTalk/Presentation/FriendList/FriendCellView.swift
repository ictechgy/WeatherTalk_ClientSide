//
//  FriendCellView.swift
//  WeaterTalk
//
//  Created by Coden on 2023/09/20.
//

import SwiftUI
import ComposableArchitecture

// MARK: - Feature Domain

struct FriendCore: Reducer {
    // 어디서는 ViewState/ViewAction이라 하고 어디서는 State/Action이라 하는데 그 기준은?
    struct ViewState: Equatable {
        var user: User
    }
    
    enum ViewAction {
        case userTapped
    }
    
    func reduce(into state: inout ViewState, action: ViewAction) -> Effect<Action> {
        switch action {
        case .userTapped:
            return .none
        }
    }
}

// MARK: - Feature View

struct FriendCellView: View {
    let name: String
    let descrioption: String
    
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title2)
                Text(descrioption)
                    .font(.callout)
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView(name: "키오", descrioption: "키오입니다")
    }
}
