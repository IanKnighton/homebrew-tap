class Noter < Formula
  desc "A Swift CLI for managing notes"
  homepage "https://github.com/IanKnighton/noter"
  url "https://github.com/IanKnighton/noter/archive/refs/tags/1.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on xcode: ["12.0", :build]
  depends_on :macos

  def install
    # Set version for embedding in binary during build
    version_string = version.to_s
    ENV["NOTER_VERSION"] = version_string
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/noter"
  end

  test do
    system "#{bin}/noter", "--version"
  end
end
