import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("PLAYBACK") {
                    Label("Audio quality", systemImage: "waveform")
                    Label("Equalizer", systemImage: "slider.horizontal.3")
                    Label("Crossfade", systemImage: "arrow.left.arrow.right")
                    Label("Sleep timer", systemImage: "moon.zzz")
                }
                Section("SERVICES") {
                    Label("Music sources", systemImage: "dot.radiowaves.left.and.right")
                    Label("Spotify connection", systemImage: "link")
                    Label("Scrobbling", systemImage: "arrow.trianglehead.2.clockwise")
                }
                Section("ABOUT") {
                    LabeledContent("Version", value: "0.1.0")
                    LabeledContent("Build", value: "Foundation milestone")
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .navigationTitle("Settings")
        }
    }
}
