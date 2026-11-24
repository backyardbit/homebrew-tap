class Claudesaurus < Formula
  desc "Graphical Claude Code chat for terminals that draw images, such as Rex"
  homepage "https://github.com/backyardbit/claudesaurus"
  # The repository is private, so the archive comes through the GitHub API and needs a token:
  #   HOMEBREW_GITHUB_API_TOKEN=$(gh auth token) brew install backyardbit/tap/claudesaurus
  url "https://api.github.com/repos/backyardbit/claudesaurus/releases/assets/785465805",
      headers: [
        "Accept: application/octet-stream",
        "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
      ]
  version "0.1.0"
  sha256 "d52ac691975c58046806e28805327ccea27739142d6a52d330bf48104fd685fd"

  depends_on "node"

  def install
    libexec.install Dir["*"]

    # PixelGUI's install script moves its Electron runtime into place with a rename, which only
    # works within one volume, so temporary files go next to where they end up.
    ENV["TMPDIR"] = (libexec/"tmp").tap(&:mkpath)
    cd libexec do
      # The pnpm that wrote the lockfile. Newer ones skip the install scripts of dependencies.
      system "npx", "--yes", "pnpm@9.15.4", "install", "--prod", "--frozen-lockfile"
    end
    rm_r libexec/"tmp"

    (bin/"claudesaurus").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/claudesaurus.mjs" "$@"
    SH
  end

  def caveats
    <<~EOS
      Claudesaurus uses your Claude Code login. If Claude Code is not logged in on this
      machine, run `claude` and then `/login` first.

      Run `claudesaurus` in a terminal that draws images with the Kitty graphics protocol,
      such as Rex, Ghostty or kitty.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claudesaurus --version")
  end
end
