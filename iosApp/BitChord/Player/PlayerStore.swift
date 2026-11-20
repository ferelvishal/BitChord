import Foundation
import SwiftUI

@MainActor
final class PlayerStore: ObservableObject {
    @Published private(set) var queue: [Track] = Track.samples
    @Published private(set) var currentIndex = 0
    @Published private(set) var isPlaying = false
    @Published var searchText = ""

    var currentTrack: Track? {
        guard queue.indices.contains(currentIndex) else { return nil }
        return queue[currentIndex]
    }

    var filteredTracks: [Track] {
        guard !searchText.isEmpty else { return queue }
        return queue.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.artist.localizedCaseInsensitiveContains(searchText) ||
            $0.album.localizedCaseInsensitiveContains(searchText)
        }
    }

    func play(_ track: Track) {
        guard let index = queue.firstIndex(of: track) else { return }
        currentIndex = index
        isPlaying = true
    }

    func togglePlayback() { isPlaying.toggle() }

    func next() {
        guard !queue.isEmpty else { return }
        currentIndex = (currentIndex + 1) % queue.count
        isPlaying = true
    }

    func previous() {
        guard !queue.isEmpty else { return }
        currentIndex = (currentIndex - 1 + queue.count) % queue.count
        isPlaying = true
    }
}
