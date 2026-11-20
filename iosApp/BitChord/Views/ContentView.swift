import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var player: PlayerStore
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            DiscoverView().tabItem { Label("Discover", systemImage: "sparkle.magnifyingglass") }.tag(0)
            LibraryView().tabItem { Label("Library", systemImage: "square.stack") }.tag(1)
            SettingsView().tabItem { Label("Settings", systemImage: "slider.horizontal.3") }.tag(2)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            if let track = player.currentTrack { MiniPlayer(track: track) { selectedTab = 0 } }
        }
        .tint(.white)
    }
}

struct MiniPlayer: View {
    @EnvironmentObject private var player: PlayerStore
    let track: Track
    let openPlayer: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            ArtworkTile(symbol: track.artworkSymbol, size: 42)
            VStack(alignment: .leading, spacing: 2) {
                Text(track.title).font(.subheadline.weight(.semibold)).lineLimit(1)
                Text(track.artist).font(.caption).foregroundStyle(.secondary).lineLimit(1)
            }
            Spacer(minLength: 4)
            Button { player.previous() } label: { Image(systemName: "backward.end.fill") }
            Button { player.togglePlayback() } label: {
                Image(systemName: player.isPlaying ? "pause.fill" : "play.fill").font(.title3)
            }
            Button { player.next() } label: { Image(systemName: "forward.end.fill") }
        }
        .buttonStyle(.plain)
        .padding(.horizontal, 14).padding(.vertical, 10)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal, 10).padding(.bottom, 4)
        .contentShape(Rectangle())
        .onTapGesture(perform: openPlayer)
    }
}

struct ArtworkTile: View {
    let symbol: String
    var size: CGFloat = 58

    var body: some View {
        RoundedRectangle(cornerRadius: size * 0.22)
            .fill(LinearGradient(colors: [.purple.opacity(0.8), .blue.opacity(0.65), .black],
                                 startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: size, height: size)
            .overlay {
                Image(systemName: symbol)
                    .font(.system(size: size * 0.36, weight: .light))
                    .foregroundStyle(.white.opacity(0.92))
            }
    }
}
