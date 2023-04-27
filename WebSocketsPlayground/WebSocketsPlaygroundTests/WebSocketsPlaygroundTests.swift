//
//  WebSocketsPlaygroundTests.swift
//  WebSocketsPlaygroundTests
//
//  Created by Ryan Neil Stroud on 27/4/2023.
//

import XCTest
@testable import WebSocketsPlayground

class WebSocketsPlaygroundTests: XCTestCase {
    
    func testSend() {
        URLProtocol.registerClass(URLProtocolStub.self)
        
        let sut = URLSessionWebSocketClient(
            url: URL(string: "wss://any-url.com")!,
            session: .shared)
        sut.connect()
        
        let expectation = XCTestExpectation(description: "Waiting for callback")
        
        sut.send(text: "any text") { error in
            XCTAssertNil(error, "Error should be nil")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        URLProtocol.unregisterClass(URLProtocolStub.self)
    }
}

class URLProtocolStub: URLProtocol {
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    // I've tried various client methods to invoke some sort of completion
    override func startLoading() {
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
