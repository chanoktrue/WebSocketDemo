//
//  ContentView.swift
//  WebSocketDemo
//
//  Created by Thongchai Subsaidee on 19/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var wsVM = WebSocketViewModel()
    
    var body: some View {
        
        VStack {
            TextField("Enter message", text: $wsVM.message)
                .padding()
            
            Button {
                wsVM.sendMessage()
            } label: {
                Text("Send message")
            }
            .padding()
            
            
            Button {
                wsVM.receivedMessage()
            } label: {
                Text("Received message")
            }
            .padding()
            
        }
        .padding()
        
        .onAppear{
            WebSocket.shared.connect()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
