# BitChord iOS — Foundation milestone

Native SwiftUI iPhone application foundation.

## Included
- iOS 18 minimum deployment target; iPhone device family
- SwiftUI Discover, Library and Settings tabs
- Now Playing sheet and mini-player
- In-memory sample catalogue and queue controls
- Search filtering and unit tests
- XcodeGen configuration and GitHub Actions simulator build

**This is a UI/application foundation, not a functioning streaming client.**
Playback buttons currently update local player state; no audio stream is fetched or played. Streaming, source adapters, authentication, lyrics providers, downloads, background playback, Spotify, scrobbling, equalizer, Automix and USB DAC support are future milestones.

## Build on macOS
Install Xcode 16+ and XcodeGen, then:

```sh
cd iosApp
xcodegen generate
xcodebuild -project BitChord.xcodeproj -scheme BitChord -destination 'platform=iOS Simulator,name=iPhone 16' CODE_SIGNING_ALLOWED=NO build
```

## Signing
GitHub Actions builds/tests the simulator without signing. A free Apple ID can be used with Xcode Personal Team for development installs on a registered iPhone, subject to provisioning limits and expiring profiles. It does not provide TestFlight or App Store distribution.
