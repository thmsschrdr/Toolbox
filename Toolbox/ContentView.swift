//
//  ContentView.swift
//  Toolbox
//
//  Created by Thomas Schröder on 21.10.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        TabView {
            
            CounterView()
            
                .tabItem {
                    Label("Counter", systemImage: "person.2.circle")
                }
            
            TextmanipulatorView()
                .tabItem {
                    Label("Textmanipulator", systemImage: "square.and.pencil.circle.fill")
                }
            
            BillSplitView()
                .tabItem {
                    Label("Kostenteiler", systemImage: "dollarsign.circle.fill")
                        
                }
                
        }
        
    }
}

#Preview {
    ContentView()
}
