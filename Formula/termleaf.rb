class Termleaf < Formula
  desc "Live-reloading PDF viewer for the terminal, built for editing LaTeX next to it"
  homepage "https://github.com/backyardbit/termleaf"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/backyardbit/termleaf/releases/download/v0.3.2/termleaf-aarch64-apple-darwin.tar.xz"
      sha256 "6c9d8ff2b722a84774474b49018cd94ffda8442816f2b2e28ab7219c6d34eaa1"
    end
    on_intel do
      url "https://github.com/backyardbit/termleaf/releases/download/v0.3.2/termleaf-x86_64-apple-darwin.tar.xz"
      sha256 "759941703d240a0b41d1b0874c3832881f5c319e9879778a4bf4ac9c20c1d753"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/backyardbit/termleaf/releases/download/v0.3.2/termleaf-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f5f7238ae072599a46dfbe38aca056696aedea55ddea63fb369bfea25aba8023"
    end
    on_intel do
      url "https://github.com/backyardbit/termleaf/releases/download/v0.3.2/termleaf-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ac4475fbd1a04b53cabb4e6f58d97db9c8681cafd0ef89de936e78526fd70ea8"
    end
  end

  def install
    bin.install "termleaf"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/termleaf --version")
  end
end
