cask "sticky-notes-canvas" do
  arch arm: "-arm64", intel: ""

  version "1.3.3"
  sha256 arm:   "6bfd9847a3e0491bf8335267b7a651eb41d6a5cd47d5b9947a26fe64077005ef",
         intel: "f4615c615c76d180469daf6d992bc50d889f2f0eb80f20fc63b69503a3d37953"

  url "https://github.com/faridjaff/sticky-notes/releases/download/v#{version}/Sticky.Notes-#{version}#{arch}.dmg",
      verified: "github.com/faridjaff/sticky-notes/"
  name "Sticky Notes"
  desc "Spatial sticky-notes canvas"
  homepage "https://github.com/faridjaff/sticky-notes"

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
