import SwiftUI

@main
struct BitChordApp: App {
    @StateObject private var player = PlayerStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(player)
                .preferredColorScheme(.dark)
        }
    }
}
