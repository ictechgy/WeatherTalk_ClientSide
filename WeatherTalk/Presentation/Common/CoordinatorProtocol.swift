//
//  CoordinatorProtocol.swift
//  WeaterTalk
//
//  Created by Coden on 2023/10/04.
//

import UIKit
import ComposableArchitecture

// MARK: - Coordinator 기본구조

protocol Coordinator {
    associatedtype CoreStore: StoreOf<Reducer>
    
    var store: CoreStore { get }
    var navigationController: UINavigationController { get }
    var children: [any Coordinator] { get }
}
