class Clockifish < Formula
  desc "A Swift CLI for interacting with the Clockify time tracking API"
  homepage "https://github.com/IanKnighton/clockifish"
  url "https://github.com/IanKnighton/clockifish/archive/refs/tags/1.2.1.tar.gz"
  sha256 "81a1df688aca282619b36881a27b0dad1d4c99c4687df5ecc7d507eb45098379"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/clockifish/releases/download/1.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "4d0a8f18ee3c558a7961c99df7befdfeda2e4af4361dacd84b51a204fa8a0e08"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "4d0a8f18ee3c558a7961c99df7befdfeda2e4af4361dacd84b51a204fa8a0e08"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "4d0a8f18ee3c558a7961c99df7befdfeda2e4af4361dacd84b51a204fa8a0e08"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "4d0a8f18ee3c558a7961c99df7befdfeda2e4af4361dacd84b51a204fa8a0e08"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "4d0a8f18ee3c558a7961c99df7befdfeda2e4af4361dacd84b51a204fa8a0e08"
  end

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
