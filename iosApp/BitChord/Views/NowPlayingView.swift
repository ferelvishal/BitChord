import SwiftUI

struct NowPlayingView: View {
    @EnvironmentObject private var player: PlayerStore
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 28) {
            HStack {
                Button { dismiss() } label: { Image(systemName: "chevron.down") }
                Spacer()
                Text("NOW PLAYING").font(.caption.weight(.bold)).tracking(2)
                Spacer()
                Image(systemName: "ellipsis")
            }
            .foregroundStyle(.secondary)

            Spacer()
            if let track = player.currentTrack {
                ArtworkTile(symbol: track.artworkSymbol, size: 280)
                    .clipShape(RoundedRectangle(cornerRadius: 28))
                    .shadow(color: .purple.opacity(0.25), radius: 35, y: 15)
                VStack(alignment: .leading, spacing: 6) {
                    Text(track.title).font(.title2.bold())
                    Text(track.artist).foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack(spacing: 8) {
                    ProgressView(value: 0.0).tint(.white)
                    HStack {
                        Text("0:00")
                        Spacer()
                        Text(track.duration.formattedDuration)
                    }
                    .font(.caption.monospacedDigit())
                    .foregroundStyle(.secondary)
                }
                HStack(spacing: 38) {
                    Button { player.previous() } label: { Image(systemName: "backward.end.fill") }
                    Button { player.togglePlayback() } label: {
                        Image(systemName: player.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            .font(.system(size: 68))
                    }
                    Button { player.next() } label: { Image(systemName: "forward.end.fill") }
                }
                .buttonStyle(.plain)
                Spacer()
            }
        }
        .padding(24)
        .background(Color.black.ignoresSafeArea())
        .preferredColorScheme(.dark)
    }
}

private extension TimeInterval {
    var formattedDuration: String {
        let seconds = Int(self)
        return String(format: "%d:%02d", seconds / 60, seconds % 60)
    }
}
