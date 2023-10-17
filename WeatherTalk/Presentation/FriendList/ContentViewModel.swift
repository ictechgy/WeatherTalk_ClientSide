//
//  ContentViewModel.swift
//  WeaterTalk
//
//  Created by Coden on 2023/08/09.
//

import Foundation
import Combine

extension Array: Identifiable where Element: Identifiable & Hashable {
    public var id: Int {
        self.hashValue
    }
}

final class ContentViewModel: NSObject {
    let _postResultStream = PassthroughSubject<Void, Never>()
    var postResultStream: AnyPublisher<Void, Never> {
        _postResultStream
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func postRandomUser() {
        Task {
            let urlString = "https://localhost:8080/user/register"
            let url = URL(string: urlString)
            var urlRequest = URLRequest(url: url!)
            
            urlRequest.httpMethod = "POST"
            urlRequest.allHTTPHeaderFields = ["content-type" : "application/json"]
            let userData = UserToCreateDTO(name: "donut", imageData: nil, userDescription: "Delicious Donut")
            let data = try! JSONEncoder().encode(userData)
            urlRequest.httpBody = data
            print("통신 보내려는 data: \(String(data: data, encoding: .utf8))")
            
            let configuration = URLSessionConfiguration.default
            let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: OperationQueue.current)
            
            let (responseData, response) = try await urlSession.data(for: urlRequest)
            
            print("통신 statusCode \((response as? HTTPURLResponse)?.statusCode)")
            print("통신 결과값 \(String(data: responseData, encoding: .utf8))")
            
            _postResultStream.send(())
        }
    }
    
    func getUsers() {
        Task {
            let urlString = "https://localhost:8080/get_users"
            let url = URL(string: urlString)
            var urlRequest = URLRequest(url: url!)
            
            urlRequest.httpMethod = "GET"
            
            let configuration = URLSessionConfiguration.default
            let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: OperationQueue.current)
            
            let (responseData, response) = try await urlSession.data(for: urlRequest)
            
            print("통신 statusCode \((response as? HTTPURLResponse)?.statusCode)")
            print("통신 결과값 \(String(data: responseData, encoding: .utf8))")
        }
    }
}

extension ContentViewModel: URLSessionDelegate {
  func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

    //accept all certs when testing, perform default handling otherwise
    completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
  }
}
