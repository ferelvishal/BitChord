import Foundation

struct Track: Identifiable, Equatable {
    let id: UUID
    let title: String
    let artist: String
    let album: String
    let duration: TimeInterval
    let artworkSymbol: String

    init(id: UUID = UUID(), title: String, artist: String, album: String,
         duration: TimeInterval, artworkSymbol: String = "waveform") {
        self.id = id
        self.title = title
        self.artist = artist
        self.album = album
        self.duration = duration
        self.artworkSymbol = artworkSymbol
    }

    static let samples = [
        Track(title: "Midnight City", artist: "M83", album: "Hurry Up, We're Dreaming", duration: 244, artworkSymbol: "moon.stars.fill"),
        Track(title: "A Walk", artist: "Tycho", album: "Dive", duration: 315, artworkSymbol: "sun.horizon.fill"),
        Track(title: "Kerala", artist: "Bonobo", album: "Migration", duration: 213, artworkSymbol: "water.waves"),
        Track(title: "Open Eye Signal", artist: "Jon Hopkins", album: "Immunity", duration: 470, artworkSymbol: "sparkles")
    ]
}
