class Skipboi < Formula
  desc "A simple macOS CLI for controlling Apple Music"
  homepage "https://github.com/IanKnighton/skipboi"
  url "https://github.com/IanKnighton/skipboi/archive/refs/tags/v0.1.4-test.tar.gz"
  sha256 "a410736bfffad88d0ef0e0af3e6dd50c4bc833f291be364bd4f8f80d30b0853f"
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
