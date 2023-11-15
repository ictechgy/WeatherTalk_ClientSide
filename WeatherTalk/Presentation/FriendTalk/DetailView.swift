//
//  DetailView.swift
//  WeaterTalk
//
//  Created by Coden on 2023/08/09.
//

import SwiftUI
import ComposableArchitecture

//struct DetailReducer: Reducer {
//    struct State {
//
//    }
//
//    enum Action {
//
//    }
//
//    func reduce(into state: inout State, action: Action) -> Effect<Action> {
//        <#code#>
//    }
//}

struct DetailView: View {
    let detailViewModel = DetailViewModel()
    
    var body: some View {
        VStack {
            NavigationStack {
                HStack {
                    Text("친구 목록")
                    Spacer()
                }
                .padding()
                
                List(User.mock) { user in
//                    ItemView(name: user.name, descrioption: user.userDescription)
                        
                }
            }
            
            
//            Text("post 요청 후 소켓 연결 화면")
//
//            Button {
//                detailViewModel.connectWss()
//            } label: {
//                Text("소켓 연결 하기")
//            }
//
//            Button {
//                detailViewModel.sendText()
//            } label: {
//                Text("send text")
//            }
//
//            Button {
//                detailViewModel.sendPing()
//            } label: {
//                Text("send ping")
//            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(coordinator: DetailCoordinator(navigationController: UINavigationController()))
//    }
//}

//final class DetailCoordinator: Coordinator {
//    let navigationController: UINavigationController
//    private(set) var children: [Coordinator] = []
//    
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//}
