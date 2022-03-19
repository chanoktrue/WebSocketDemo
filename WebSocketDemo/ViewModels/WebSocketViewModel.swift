//
//  WebSocketViewModel.swift
//  WebSocketDemo
//
//  Created by Thongchai Subsaidee on 19/3/22.
//

import SwiftUI

class WebSocketViewModel: ObservableObject {
    
    @Published var message: String = ""
    
    @Published var messages: [String] = []
    
    func connect() {
        WebSocket.shared.connect()
    }
    
    func sendMessage() {
        WebSocket.shared.sendMessage(message: message)
    }
    
    
    func receivedMessage() {
        WebSocket.shared.receivedMessage()
    }
    
    
    
}
