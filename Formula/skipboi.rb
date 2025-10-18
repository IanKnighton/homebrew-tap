class Skipboi < Formula
  desc "A simple macOS CLI for controlling Apple Music"
  homepage "https://github.com/IanKnighton/skipboi"
  url "https://github.com/IanKnighton/skipboi/archive/refs/tags/2.2.0.tar.gz"
  sha256 "8c3303ad9bf727f867ff931763af7551cb87d2175f24b2dc5ae1df90c6952431"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/skipboi/releases/download/2.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "1a8c4fa8312e92a5ed5343fa96e468364f1de53bb91fd1a7c39e59f277656b1b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "1a8c4fa8312e92a5ed5343fa96e468364f1de53bb91fd1a7c39e59f277656b1b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "1a8c4fa8312e92a5ed5343fa96e468364f1de53bb91fd1a7c39e59f277656b1b"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "1a8c4fa8312e92a5ed5343fa96e468364f1de53bb91fd1a7c39e59f277656b1b"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "1a8c4fa8312e92a5ed5343fa96e468364f1de53bb91fd1a7c39e59f277656b1b"
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
