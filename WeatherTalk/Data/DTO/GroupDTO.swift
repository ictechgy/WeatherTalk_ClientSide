//
//  GroupDTO.swift
//  WeaterTalk
//
//  Created by Coden on 2023/10/04.
//

import Foundation

// MARK: GroupDTO
struct GroupDTO: Decodable {
    let id: Int
    let name: String
}

extension GroupDTO {
    func toDomain() -> Group {
        .init(
            id: self.id,
            name: self.name
        )
    }
}
