//
//  FriendCellView.swift.swift
//  WeaterTalk
//
//  Created by Coden on 2023/09/20.
//

import SwiftUI
import ComposableArchitecture

struct FriendCellView.swift: View {
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
        ItemView(name: "키오", descrioption: "키오입니다")
    }
}
