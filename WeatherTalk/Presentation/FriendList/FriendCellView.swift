//
//  FriendCellView.swift
//  WeaterTalk
//
//  Created by Coden on 2023/09/20.
//

import SwiftUI
import ComposableArchitecture

// MARK: - Feature Domain

struct FriendCellCore: Reducer {
    // 어디서는 ViewState/ViewAction이라 하고 어디서는 State/Action이라 하는데 그 기준은?
    struct State: Equatable, Identifiable {
        var id: Int
        var image: Image?
        var userName: String
        var description: String
    }
    
    enum Action {
        case cellTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}

// MARK: - Feature View

struct FriendCellView: View {
    let store: StoreOf<FriendCellCore>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                (viewStore.image ?? Image("person.fill"))
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.blue)
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text(viewStore.userName)
                        .font(.title2)
                    Text(viewStore.description)
                        .font(.callout)
                }
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView(
            store: .init(
                initialState:
                        .init(
                            id: 1,
                            image: Image("person.fill"),
                            userName: "키오",
                            description: "키오입니다"
                        ),
                reducer: {
                    FriendCellCore()
                }
            )
        )
    }
}
