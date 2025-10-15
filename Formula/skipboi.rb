class Skipboi < Formula
  desc "A simple macOS CLI for controlling Apple Music"
  homepage "https://github.com/IanKnighton/skipboi"
  url "https://github.com/IanKnighton/skipboi/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "3a4340b8206f6ed6e0012d82e939dd996b3038d3a694c37304025049643cb872"
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
