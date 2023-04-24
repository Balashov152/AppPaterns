//

import SwiftUI

struct SUIVIPERView: View {
    private let output: SUIVIPERViewOutput?
    @ObservedObject private var state: SUIVIPERViewState
    
    init(output: SUIVIPERViewOutput?, state: SUIVIPERViewState) {
        self.output = output
        self.state = state
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
    }
}
