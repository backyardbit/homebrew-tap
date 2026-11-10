cask "shovel" do
  version "0.3.0"
  sha256 "256cbcac83b9acbd303ffc22faad1b23a7d2da859425f1fd4d41c0d1b4104d31"

  url "https://github.com/backyardbit/shovel/releases/download/v#{version}/Shovel-#{version}.dmg"
  name "Shovel"
  desc "Disposable virtual machines for agents"
  homepage "https://github.com/backyardbit/shovel"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Shovel.app"
  binary "#{appdir}/Shovel.app/Contents/Helpers/shovel"

  # Shovel.app is ad-hoc signed, not notarized, so Gatekeeper would refuse to launch it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Shovel.app"]
  end

  # Quitting the host suspends running VMs.
  uninstall quit: "dev.shovel.Shovel"

  caveats <<~EOS
    VMs, images and saved state live in ~/.shovel and are kept on uninstall.

    To teach Claude Code to use Shovel:
      cp -R #{staged_path}/skills/shovel ~/.claude/skills/
  EOS
end
