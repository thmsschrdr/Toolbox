//
//  TodoView.swift
//  Toolbox
//
//  Created by Thomas Schröder on 21.10.23.
//

import SwiftUI

struct TextmanipulatorView: View {
    
    @State private var text = ""
    @State private var capMode = 0
    @State private var copied = false {
        didSet {
            if copied == true {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        copied = false
                    }
                }
            }
        }
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
        GeometryReader { geo in
            ZStack {
                if copied {
                    Text("Copied to clipboard")
                        .padding()
                        .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
                        .background(colorScheme == .dark ? Color.white : Color.black)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).width/2)
                        .transition(.move(edge: .top))
                        .padding(.top)
                        .animation(Animation.easeInOut(duration: 1))
                }
                
                    VStack {
                        Spacer()
                        if capMode == 1 {
                            Text(text.uppercased())
                                .font(.largeTitle)
                        } else if capMode == 2 {
                            Text(text.capitalized)
                                .font(.largeTitle)
                        } else if capMode == 3 {
                            Text(text.lowercased())
                                .font(.largeTitle)
                        } else if capMode == 0 {
                            Text(text)
                                .font(.largeTitle)
                        }
                            
                        Spacer()
                        Spacer()
                        Divider()
                        HStack(alignment: .center) {
                            TextField("Enter text here", text: $text)
                                .frame(width: 250)
                                .padding(7)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(.secondary, lineWidth: 1)
                                    )
                            
                            Button(action: {
                                let pasteboard = UIPasteboard.general
                                
                                if capMode == 1 {
                                    pasteboard.string = text.uppercased()
                                } else if capMode == 2 {
                                    pasteboard.string = text.capitalized
                                } else if capMode == 3 {
                                    pasteboard.string = text.lowercased()
                                }
                                copied = true
                                
                            }, label: {
                                Image(systemName: "list.bullet.clipboard.fill").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                            })
                        }
                        
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                capMode = 1
                            }, label: {
                                Text("ABC")
                                    .padding(10)
                                    .padding(.horizontal)
                                    .background(colorScheme == .dark ? Color(red:230/255, green:230/255, blue:230/255) : Color.red)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
                                    
                            })
                            
                            Button(action: {
                                capMode = 2
                            }, label: {
                                Text("Abc")
                                    .padding(10)
                                    .padding(.horizontal)
                                    .background(colorScheme == .dark ? Color(red:179/255, green:179/255, blue:179/255) : Color.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
                            })
                            
                            Button(action: {
                                capMode = 3
                            }, label: {
                                Text("abc")
                                    .padding(10)
                                    .padding(.horizontal)
                                    .background(colorScheme == .dark ? Color(red:102/255, green:102/255, blue:102/255) : Color.green)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
                            })
                        }
                        .padding(.bottom)
                    }
                    .navigationTitle("Textmanipulator")
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
        
#Preview {
    TextmanipulatorView()
}
