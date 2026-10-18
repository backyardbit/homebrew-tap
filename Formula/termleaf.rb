class Termleaf < Formula
  desc "Live-reloading PDF viewer for the terminal, built for editing LaTeX next to it"
  homepage "https://github.com/backyardbit/termleaf"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/backyardbit/termleaf/releases/download/v0.4.0/termleaf-aarch64-apple-darwin.tar.xz"
      sha256 "6c655cd967d80ca314f1eeaf02e6aaee3da7ad9478f5404b921d03156a2f9535"
    end
    on_intel do
      url "https://github.com/backyardbit/termleaf/releases/download/v0.4.0/termleaf-x86_64-apple-darwin.tar.xz"
      sha256 "3247d2af33b632b541739f28c4dbe4d77d643f2be39d42bc1d4486c0a5300e75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/backyardbit/termleaf/releases/download/v0.4.0/termleaf-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "fa2852eec8cc5c35021c6a96a832a13892f5ecf4c334f354241791376ce86f73"
    end
    on_intel do
      url "https://github.com/backyardbit/termleaf/releases/download/v0.4.0/termleaf-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bb3d5e342e0a0daf5b7c1937b049f297811c24725de94233ff10529d127406f0"
    end
  end

  def install
    bin.install "termleaf"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/termleaf --version")
  end
end
