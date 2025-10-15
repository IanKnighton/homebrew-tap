class Skipboi < Formula
  desc "A simple macOS CLI for controlling Apple Music"
  homepage "https://github.com/IanKnighton/skipboi"
  url "https://github.com/IanKnighton/skipboi/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "09ef3e10db2fcbf76fdc2747b7ce9a4c759d620b6ec43944eedf1a0c4ce6cc6d"
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
