//
//  MVPSUIView.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 27.05.2022.
//

import SwiftUI

struct MVPSUIView: View {
    private var output: MVPSUIViewOutput
    @ObservedObject private var state: MVPSUIViewState
    
    init(output: MVPSUIViewOutput, state: MVPSUIViewState) {
        self.output = output
        self.state = state
    }
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Hello, this is MVP + SUI Example screen!")

            Text("This screen index \(state.viewIndex)")

            Button {
                output.viewDidRequestUpdateIndex()
            } label: {
                Text("Update Index")
            }
        }
        .toolbar {
            HStack {
                Spacer()

                Button {
                    output.viewDidRequestNextView()
                } label: {
                    Text("Open next screen")
                }
            }
        }
    }
}
