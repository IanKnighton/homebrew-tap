class Skipboi < Formula
  desc "A simple macOS CLI for controlling Apple Music"
  homepage "https://github.com/IanKnighton/skipboi"
  url "https://github.com/IanKnighton/skipboi/archive/refs/tags/v1.2.8.tar.gz"
  sha256 "2f072ca1602cf45019468ca9acf12f9d2eee3d41d559f260b8c404943997fc77"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/skipboi/releases/download/v1.2.8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "dc38afaca1d9d5ac022d926f9deec3327f40baf025e78cd2bc43a387bb142f6e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "dc38afaca1d9d5ac022d926f9deec3327f40baf025e78cd2bc43a387bb142f6e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "dc38afaca1d9d5ac022d926f9deec3327f40baf025e78cd2bc43a387bb142f6e"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "dc38afaca1d9d5ac022d926f9deec3327f40baf025e78cd2bc43a387bb142f6e"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "dc38afaca1d9d5ac022d926f9deec3327f40baf025e78cd2bc43a387bb142f6e"
  end

  depends_on xcode: ["12.0", :build]
  depends_on :macos

  def install
    # Set version for embedding in binary during build
    version_string = version.to_s
    ENV["SKIPBOI_VERSION"] = version_string
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/skipboi"
  end

  test do
    system "#{bin}/skipboi", "help"
  end
end
