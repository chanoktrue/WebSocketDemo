//
//  WebSocket.swift
//  WebSocketDemo
//
//  Created by Thongchai Subsaidee on 19/3/22.
//

import SwiftUI
import CocoaMQTT
import CocoaMQTTWebSocket

class WebSocket {
    
    init() {}
    
    static let shared = WebSocket()

    var mqtt = CocoaMQTT(clientID: "")
    let websocket = CocoaMQTTWebSocket(uri: "/mqtt")

    func connect() {
        mqtt = CocoaMQTT(clientID: "clientId", host: "127.0.0.1", port: 8080, socket: websocket)
        mqtt.keepAlive = 60
        mqtt.logLevel = .debug
        _ = mqtt.connect()
        
        
        let data = Data("สวัสดี".utf8)
        websocket.write(data, withTimeout: -1, tag: 0)
        
    }
    
    
    func sendMessage(message: String) {
        let data = Data(message.utf8)
        websocket.write(data, withTimeout: -1, tag: 0)
    }
    
    func receivedMessage() {
        websocket.readData(toLength: 100, withTimeout: -1, tag: 0)
    }
    
}
