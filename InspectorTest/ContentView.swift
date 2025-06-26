//
//  ContentView.swift
//  InspectorTest
//
//  Created by Alessio Moiso on 25/06/25.
//

import SwiftUI

struct ContentView: View {
    enum Option: String, Hashable, CaseIterable, Identifiable {
        case one = "One", two = "Two", three = "Three"
        
        var id: String {
            rawValue
        }
    }
    
    @State private var text = ""
    @State private var selection: Option? = Option.one
    
    var body: some View {
        NavigationSplitView(
            sidebar: {
                List {
                    
                }
            },
            detail: {
                Image("Background")
                    .frame(maxWidth: 1024, maxHeight: 1024)
                    .inspector(isPresented: .constant(true), content: {
                        VStack(spacing: 20) {
                            Button(action: {}) {
                                Text("Test")
                            }
                            .buttonStyle(.borderedProminent)
                            
                            TextField("Placeholder", text: $text)
                                .textFieldStyle(.roundedBorder)
                            
                            Picker("Test", selection: $selection, content: {
                                ForEach(Option.allCases) { option in
                                    Text(option.rawValue)
                                        .tag(option)
                                }
                            })
                            .pickerStyle(.segmented)
                        }
                        .padding()
                    })
            }
        )
    }
}

#Preview {
    ContentView()
}
