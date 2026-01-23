class Clockifish < Formula
  desc "A Swift CLI for interacting with the Clockify time tracking API"
  homepage "https://github.com/IanKnighton/clockifish"
  url "https://github.com/IanKnighton/clockifish/archive/refs/tags/1.3.0.tar.gz"
  sha256 "cc1bc9e044cd1f37bfd6ef5b14fde07b0d8d21267a79a6e4c69a496396b7c7d1"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/clockifish/releases/download/1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "7f1048cc7abd5febef4beb2f63c14101edba2158e6bea84b3ed1a29531d29e34"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "7f1048cc7abd5febef4beb2f63c14101edba2158e6bea84b3ed1a29531d29e34"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "7f1048cc7abd5febef4beb2f63c14101edba2158e6bea84b3ed1a29531d29e34"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "7f1048cc7abd5febef4beb2f63c14101edba2158e6bea84b3ed1a29531d29e34"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "7f1048cc7abd5febef4beb2f63c14101edba2158e6bea84b3ed1a29531d29e34"
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
