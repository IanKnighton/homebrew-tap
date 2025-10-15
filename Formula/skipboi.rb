class Skipboi < Formula
  desc "A simple macOS CLI for controlling Apple Music"
  homepage "https://github.com/IanKnighton/skipboi"
  url "https://github.com/IanKnighton/skipboi/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "bed63653517cd4b04cffcf7c01f0270d91b5961eb12a359402bcef8bb68b2a84"
  license "MIT"

  depends_on xcode: ["12.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/skipboi"
  end

  test do
    system "#{bin}/skipboi", "help"
  end
end
