//
//  WebSocketConnection.swift
//  WebSocketsPlayground
//
//  Created by Ryan Neil Stroud on 27/4/2023.
//

import Foundation

// Commenting out since it's not the SUT

//final class WebSocketConnection<Resource> {
//    private let client: WebSocketClient
//    private let mapper: Mapper
//    
//    typealias Result = Swift.Result<Resource, Swift.Error>
//    typealias Mapper = (String) throws -> Resource
//    
//    init(client: WebSocketClient, mapper: @escaping Mapper) {
//        self.client = client
//        self.mapper = mapper
//    }
//    
//    func connect() { client.connect() }
//    func disconnect() { client.disconnect() }
//    
//    func send(text: String, completion: @escaping (Error?) -> Void) {
//        client.send(text: text, completion: completion)
//    }
//    
//    func receive(onReceived: @escaping (Result) -> Void) {
//        client.receive { [weak self] result in
//            guard let self = self else { return }
//            
//            switch result {
//            case .success(let message):
//                onReceived(self.map(message))
//            case .failure(let error):
//                onReceived(.failure(error))
//            }
//        }
//    }
//    
//    private func map(_ message: String) -> Result {
//        do {
//            return .success(try mapper(message))
//        } catch {
//            return .failure(error)
//        }
//    }
//}
