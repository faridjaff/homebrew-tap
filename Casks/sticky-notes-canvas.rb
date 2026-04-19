cask "sticky-notes-canvas" do
  arch arm: "-arm64", intel: ""

  version "1.3.6"
  sha256 arm:   "44dc0f5788922792ba82d77ab6d04900b7c6c16908199722447bd3243baca1d8",
         intel: "ee86d264ea563d93a67e4722ff5019fb0f876c1a37f5604b8ae91f05a7d64fa3"

  url "https://github.com/faridjaff/StickyNotesCanvas/releases/download/v#{version}/Sticky.Notes-#{version}#{arch}.dmg",
      verified: "github.com/faridjaff/StickyNotesCanvas/"
  name "Sticky Notes"
  desc "Spatial sticky-notes canvas"
  homepage "https://github.com/faridjaff/StickyNotesCanvas"

  # Polls GitHub Releases for new tags. When a new version ships, the
  # cask version updates automatically; the user just `brew upgrade`s.
  livecheck do
    url :url
    strategy :github_latest
  end

  app "Sticky Notes.app"

  # Removes data left behind on `brew uninstall --zap`. Notes themselves
  # live in Application Support; the rest is OS / Electron caches.
  zap trash: [
    "~/Library/Application Support/sticky-notes-canvas",
    "~/Library/Logs/sticky-notes-canvas",
    "~/Library/Preferences/com.local.sticky-notes.plist",
    "~/Library/Saved Application State/com.local.sticky-notes.savedState",
  ]

  caveats <<~EOS
    Sticky Notes is not code-signed for macOS. On first launch you may
    see a Gatekeeper warning that the developer can't be verified.

    To bypass it: open Finder → Applications, right-click "Sticky Notes",
    and choose Open. Confirm when prompted. Subsequent launches will
    open normally.
  EOS
end
