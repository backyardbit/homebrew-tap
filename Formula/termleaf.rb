class Termleaf < Formula
  desc "Live-reloading PDF viewer for the terminal, built for editing LaTeX next to it"
  homepage "https://github.com/backyardbit/termleaf"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/backyardbit/termleaf/releases/download/v0.3.1/termleaf-aarch64-apple-darwin.tar.xz"
      sha256 "9fc6df95ea86052d6606e72912220ec0fb734c4d5d6d94d8dfa915ed88e64297"
    end
    on_intel do
      url "https://github.com/backyardbit/termleaf/releases/download/v0.3.1/termleaf-x86_64-apple-darwin.tar.xz"
      sha256 "ef6917c6f5fc169d76b0a38a36136505936418d472831d90d0192ae2c799339c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/backyardbit/termleaf/releases/download/v0.3.1/termleaf-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f522a9242b8ceb57faa86b26e7ace19c41f6e141a1d587941ef9423138330b9f"
    end
    on_intel do
      url "https://github.com/backyardbit/termleaf/releases/download/v0.3.1/termleaf-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "def5ff8a31cd194c14d6cbd016732027534b98c8e42642e5fe70cb16b36a9570"
    end
  end

  def install
    bin.install "termleaf"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/termleaf --version")
  end
end
