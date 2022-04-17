//

import SwiftUI

struct ChatsListView: View {
    private let output: ChatsListViewOutput?
    @ObservedObject private var state: ChatsListViewState
    
    init(output: ChatsListViewOutput?, state: ChatsListViewState) {
        self.output = output
        self.state = state
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
    }
}
