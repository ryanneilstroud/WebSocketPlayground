//
//  WebSocketClient.swift
//  WebSocketsPlayground
//
//  Created by Ryan Neil Stroud on 27/4/2023.
//

import Foundation

protocol WebSocketDataClient {
    func send(text: String, completion: @escaping (Error?) -> Void)
    func receive(onReceived: @escaping (Result<String, Error>) -> Void)
}

protocol WebSocketConnectionClient {
    func connect()
    func disconnect()
}

typealias WebSocketClient = WebSocketDataClient & WebSocketConnectionClient
