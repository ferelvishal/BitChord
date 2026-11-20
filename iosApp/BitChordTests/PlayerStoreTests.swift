import XCTest
@testable import BitChord

@MainActor
final class PlayerStoreTests: XCTestCase {
    func testNextAdvancesAndWrapsQueue() {
        let store = PlayerStore()
        let first = store.currentTrack
        store.next()
        XCTAssertNotEqual(store.currentTrack, first)
        for _ in 0..<store.queue.count { store.next() }
        XCTAssertEqual(store.currentTrack, first)
    }
    func testPlaySelectsRequestedTrack() {
        let store = PlayerStore()
        let track = store.queue[2]
        store.play(track)
        XCTAssertEqual(store.currentTrack, track)
        XCTAssertTrue(store.isPlaying)
    }
    func testSearchFiltersByArtist() {
        let store = PlayerStore()
        store.searchText = "Bonobo"
        XCTAssertEqual(store.filteredTracks.count, 1)
        XCTAssertEqual(store.filteredTracks.first?.artist, "Bonobo")
    }
}
