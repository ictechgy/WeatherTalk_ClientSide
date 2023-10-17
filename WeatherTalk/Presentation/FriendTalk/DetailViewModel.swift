//
//  DetailViewModel.swift
//  WeaterTalk
//
//  Created by Coden on 2023/08/09.
//

import Foundation

final class DetailViewModel: NSObject {
    private var webSocketTask: URLSessionWebSocketTask?
    
    func connectWss() {
        let urlString = "wss://127.0.0.1:8080/echo"
        let url = URL(string: urlString)!
        let configuration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: OperationQueue.current)

        let socketTask = urlSession.webSocketTask(with: url)
        self.webSocketTask = socketTask
        
        activateReceivingMessage()
        socketTask.resume()
    }
    
    private func activateReceivingMessage() {
        guard let webSocketTask = webSocketTask else { return }
        
        Task {
            while true {
                let message = try await webSocketTask.receive()
                print("클라에서 받은 메시지 from server \(message)")
            }
        }
    }
    
    func sendText() {
        guard let webSocketTask = webSocketTask else { return }
        
        Task {
            do {
                try await webSocketTask.send(.string("무야호 sended from client"))
            } catch {
                print(error)
            }
        }
    }
    
    func sendPing() {
        guard let webSocketTask = webSocketTask else { return }
        
        webSocketTask.sendPing(pongReceiveHandler: { error in
            if let error = error {
                print("ping error \(error)")
            }
        })
    }
}

extension DetailViewModel: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

      //accept all certs when testing, perform default handling otherwise
      completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
}
