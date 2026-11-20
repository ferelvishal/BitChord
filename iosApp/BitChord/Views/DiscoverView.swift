import SwiftUI

struct DiscoverView: View {
    @EnvironmentObject private var player: PlayerStore
    @State private var showNowPlaying = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("BITCHORD").font(.caption.weight(.bold)).tracking(3).foregroundStyle(.secondary)
                        Text("Find your frequency.").font(.largeTitle.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    HStack {
                        Image(systemName: "magnifyingglass").foregroundStyle(.secondary)
                        TextField("Search tracks, artists, albums", text: $player.searchText)
                            .textInputAutocapitalization(.never)
                    }
                    .padding(14)
                    .background(.white.opacity(0.07), in: RoundedRectangle(cornerRadius: 14))

                    VStack(alignment: .leading, spacing: 14) {
                        Text("YOUR ROTATION").font(.caption.weight(.bold)).tracking(2).foregroundStyle(.secondary)
                        ForEach(player.filteredTracks) { track in
                            Button {
                                player.play(track)
                                showNowPlaying = true
                            } label: {
                                HStack(spacing: 13) {
                                    ArtworkTile(symbol: track.artworkSymbol)
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(track.title).font(.headline).foregroundStyle(.primary)
                                        Text(track.artist).font(.subheadline).foregroundStyle(.secondary)
                                    }
                                    Spacer()
                                    Image(systemName: "ellipsis").foregroundStyle(.secondary)
                                }
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(20)
            }
            .background(Color.black.ignoresSafeArea())
            .toolbar(.hidden, for: .navigationBar)
            .sheet(isPresented: $showNowPlaying) {
                NowPlayingView().presentationDetents([.large]).presentationDragIndicator(.visible)
            }
        }
    }
}
