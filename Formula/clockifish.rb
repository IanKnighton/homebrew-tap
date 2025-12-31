class Clockifish < Formula
  desc "A Swift CLI for interacting with the Clockify time tracking API"
  homepage "https://github.com/IanKnighton/clockifish"
  url "https://github.com/IanKnighton/clockifish/archive/refs/tags/1.0.1.tar.gz"
  sha256 "68300d10feb643a3f5b34d6ae437120e65f24a248a2d3f142a49585832387e5f"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/clockifish/releases/download/1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "08505327eb684e3959d2d40a05ca9f1909c71f544c269477a209a32700ca16db"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "08505327eb684e3959d2d40a05ca9f1909c71f544c269477a209a32700ca16db"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "08505327eb684e3959d2d40a05ca9f1909c71f544c269477a209a32700ca16db"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "08505327eb684e3959d2d40a05ca9f1909c71f544c269477a209a32700ca16db"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "08505327eb684e3959d2d40a05ca9f1909c71f544c269477a209a32700ca16db"
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
