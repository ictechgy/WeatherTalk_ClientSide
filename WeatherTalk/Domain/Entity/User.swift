//
//  User.swift
//  WeaterTalk
//
//  Created by Coden on 2023/10/04.
//

import Foundation

// MARK: User Entity
struct User: Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let group: Group?
    let imageUrl: String?
    let userDescription: String
}

extension User {
    static let mock = [
        User(id: 0, name: "키오", group: nil, imageUrl: nil, userDescription: "키오입니다"),
        User(id: 1, name: "웨더", group: nil, imageUrl: nil, userDescription: "웨더입니다"),
        User(id: 2, name: "엘렌", group: nil, imageUrl: nil, userDescription: "엘렌입니다"),
        User(id: 3, name: "솔", group: nil, imageUrl: nil, userDescription: "솔입니다"),
        User(id: 4, name: "웅", group: nil, imageUrl: nil, userDescription: "웅입니다")
    ]
}
