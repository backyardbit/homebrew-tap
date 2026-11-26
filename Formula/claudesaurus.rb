class Claudesaurus < Formula
  desc "Graphical Claude Code chat for terminals that draw images, such as Rex"
  homepage "https://github.com/backyardbit/claudesaurus"
  url "https://github.com/backyardbit/claudesaurus/releases/download/v0.4.1/claudesaurus-0.4.1.tar.gz"
  sha256 "51da8d20ae14ff46b610749fc910a39049148695db2f0b87c31c67ee139ec5b2"
  license "MIT"

  depends_on "node"

  # Only the built app is installed here. Its runtime, PixelGUI's Electron and Claude Code, is
  # made of signed programs that Homebrew would rewrite and re-sign, which stops them from
  # starting on macOS. The app downloads them into the user's data folder on first run.
  def install
    libexec.install Dir["*"]
    (bin/"claudesaurus").write <<~SH
      #!/bin/bash
      export CLAUDESAURUS_LAUNCHER="#{opt_bin}/claudesaurus"
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/claudesaurus.mjs" "$@"
    SH
  end

  def caveats
    <<~EOS
      The first run downloads the app's runtime into ~/.local/share/claudesaurus, which takes
      about a minute. To do that ahead of time, run:
        claudesaurus --setup
      Uninstalling leaves that folder behind. Delete it to free the space.

      Claudesaurus uses your Claude Code login. If Claude Code is not logged in on this
      machine, run `claude` and then `/login` first.

      Run `claudesaurus` in a terminal that draws images with the Kitty graphics protocol,
      such as Rex, Ghostty or kitty.

      In Rex, the first run (or `claudesaurus --setup`) adds two actions to the command palette,
      to open Claudesaurus in a horizontal or vertical split. They are loaded from a marked
      block in ~/.config/rex/init.lua. To take them out, run:
        claudesaurus --remove-rex-actions
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claudesaurus --version")
  end
end
