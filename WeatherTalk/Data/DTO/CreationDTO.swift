//
//  CreationDTO.swift
//  WeaterTalk
//
//  Created by Coden on 2023/10/04.
//

import Foundation

// MARK: - Create DTO

// MARK: User
struct UserToCreateDTO: Encodable {
    let name: String
    let imageData: Data?
    let userDescription: String
}

extension UserToCreateDTO {
    init(entity: UserToCreate) {
        self.init(
            name: entity.name,
            imageData: entity.imageData,
            userDescription: entity.userDescription
        )
    }
}

// MARK: Group
struct GroupToCreateDTO: Encodable {
    let name: String
}

extension GroupToCreateDTO {
    init(entity: GroupToCreate) {
        self.init(
            name: entity.name
        )
    }
}
