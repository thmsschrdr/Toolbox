//
//  CounterView.swift
//  Toolbox
//
//  Created by Thomas Schröder on 21.10.23.
//

import SwiftUI

struct CounterView: View {
    @State var peoplecount = 0
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        ZStack {
            //Color(UIColor.systemGray6)
              //  .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                NavigationStack {
                    Text("\(peoplecount)")
                        .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                        .font(.system(size: 80))
                        .bold()
                        .navigationTitle("Counter")
                        
                }
                Spacer()
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        peoplecount -= 1
                    }){
                        Text("Count -")
                            .padding()
                            .frame(maxHeight: 30)
                            .background(.blue)
                            .foregroundStyle(.white)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    Spacer()
                    Button(action: {
                        peoplecount += 1
                    }) {
                        Text("Count +")
                            .padding()
                            .frame(maxHeight: 30)
                            .background(Color.green)
                            .foregroundStyle(.white)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    Spacer()
                }
                .padding(.bottom)
                
            }
        }
        
    }
    
}



#Preview {
    CounterView()
}
