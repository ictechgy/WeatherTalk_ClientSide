//
//  UserDTO.swift
//  WeaterTalk
//
//  Created by Coden on 2023/10/04.
//

import Foundation

// MARK: UserDTO
struct UserDTO: Decodable {
    let id: Int
    let name: String
    let group: GroupDTO?
    let imageUrl: String?
    let userDescription: String
}

extension UserDTO {
    func toDomain() -> User {
        .init(
            id: self.id,
            name: self.name,
            group: self.group?.toDomain(),
            imageUrl: self.imageUrl,
            userDescription: self.userDescription
        )
    }
}
