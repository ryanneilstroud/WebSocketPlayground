//
//  URLSessionWebSocketClient.swift
//  WebSocketsPlayground
//
//  Created by Ryan Neil Stroud on 27/4/2023.
//

import Foundation

final class URLSessionWebSocketClient {
    private let task: URLSessionWebSocketTask
    
    init(url: URL, session: URLSession) {
        self.task = session.webSocketTask(with: url)
    }
}

extension URLSessionWebSocketClient: WebSocketDataClient {
    private struct UnexpectedValuesRepresentation: Error {}
    
    func send(text: String, completion: @escaping (Error?) -> Void) {
        task.send(.string(text), completionHandler: completion)
    }
    
    func receive(onReceived: @escaping (Result<String, Error>) -> Void) {
        task.receive { result in
            switch result {
            case let .success(.string(text)):
                onReceived(.success(text))
            case let .failure(error):
                onReceived(.failure(error))
            default:
                onReceived(.failure(UnexpectedValuesRepresentation()))
            }
        }
    }
    
}

extension URLSessionWebSocketClient: WebSocketConnectionClient {
    func connect() { task.resume() }
    func disconnect() { task.cancel() }
}
