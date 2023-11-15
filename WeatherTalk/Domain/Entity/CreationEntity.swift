//
//  CreationEntity.swift
//  WeaterTalk
//
//  Created by Coden on 2023/10/04.
//

import Foundation

// MARK: - Create Domain

// MARK: User
struct UserToCreate {
    let name: String
    let imageData: Data?
    let userDescription: String
}

// MARK: Group
struct GroupToCreate {
    let name: String
}
