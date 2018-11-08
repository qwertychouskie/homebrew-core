class Topgrade < Formula
  desc "Upgrade all the things"
  homepage "https://github.com/r-darwish/topgrade"
  url "https://github.com/r-darwish/topgrade/archive/v0.19.0.tar.gz"
  sha256 "0b2ebb65f3fe4884186d2a47811b7036937a0e197de34786fc99c77ce4563f0f"

  bottle do
    sha256 "b7087d33d3b2fec5fbd2b61d684f2dac4fa6957a0508682de22db38a212d3297" => :mojave
    sha256 "9ac4e50c215f9c3485f5b7abad790eb1732e63c404443d4b20af1c0c3507b068" => :high_sierra
    sha256 "6d2d587990f5a2223140bda12ddd5937e20bf1b48d9cb5bb40d20e75442ff82e" => :sierra
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
  end

  test do
    output = shell_output("#{bin}/topgrade -n")
    assert_match "Dry running: #{HOMEBREW_PREFIX}/bin/brew upgrade", output
    assert_not_match /\sSelf update\s/, output
  end
end
