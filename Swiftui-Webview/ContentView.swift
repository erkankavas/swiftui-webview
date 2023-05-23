//
//  ContentView.swift
//  Swiftui-Webview
//
//  Created by Erkan Kavas on 23.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var network = Network()
    
    struct GrowingButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.largeTitle)
                .padding()
                .padding()
                .background(Color.accentColor)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    func reload() {
       _ = network.checkConnection()
    }
    
    let defaults = UserDefaults.standard;
    
    var body: some View {
        ZStack {
             
            if (true) {
                WebView(url: URL(string: "https://www.erkankavas.com")!).onAppear {
                    defaults.set(defaults.integer(forKey:"counter") + 1 , forKey: "counter")
                }
            }
            else{
                //error yazdır.
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
