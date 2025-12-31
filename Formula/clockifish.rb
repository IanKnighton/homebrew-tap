class Clockifish < Formula
  desc "A Swift CLI for interacting with the Clockify time tracking API"
  homepage "https://github.com/IanKnighton/clockifish"
  url "https://github.com/IanKnighton/clockifish/archive/refs/tags/1.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on xcode: ["12.0", :build]
  depends_on :macos

  def install
    # Set version for embedding in binary during build
    version_string = version.to_s
    ENV["CLOCKIFISH_VERSION"] = version_string
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/clockifish"
  end

  test do
    system "#{bin}/clockifish", "--version"
  end
end
