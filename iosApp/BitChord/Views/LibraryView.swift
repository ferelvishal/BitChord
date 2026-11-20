import SwiftUI

struct LibraryView: View {
    @EnvironmentObject private var player: PlayerStore

    var body: some View {
        NavigationStack {
            List {
                Section("COLLECTION") {
                    Label("Playlists", systemImage: "music.note.list")
                    Label("Liked songs", systemImage: "heart")
                    Label("Downloads", systemImage: "arrow.down.circle")
                    Label("Local music", systemImage: "folder")
                }
                Section("RECENTLY PLAYED") {
                    ForEach(player.queue) { track in
                        Button { player.play(track) } label: {
                            HStack(spacing: 12) {
                                ArtworkTile(symbol: track.artworkSymbol, size: 42)
                                VStack(alignment: .leading) {
                                    Text(track.title).foregroundStyle(.primary)
                                    Text(track.artist).font(.caption).foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .navigationTitle("Library")
        }
    }
}
