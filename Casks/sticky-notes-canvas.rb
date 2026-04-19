cask "sticky-notes-canvas" do
  arch arm: "-arm64", intel: ""

  version "1.3.5"
  sha256 arm:   "026a06d96dbecba77675aad2ce5412fd0bd3da6b4b0180b19f0b09906e243173",
         intel: "92b6cc4693511af17fb0cfa6b4a38e6ca4610dc5b9edb56eeca5291d2cb81c28"

  url "https://github.com/faridjaff/sticky-notes-canvas/releases/download/v#{version}/Sticky.Notes-#{version}#{arch}.dmg",
      verified: "github.com/faridjaff/sticky-notes-canvas/"
  name "Sticky Notes"
  desc "Spatial sticky-notes canvas"
  homepage "https://github.com/faridjaff/sticky-notes-canvas"

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
