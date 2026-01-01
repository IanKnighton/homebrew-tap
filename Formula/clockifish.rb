class Clockifish < Formula
  desc "A Swift CLI for interacting with the Clockify time tracking API"
  homepage "https://github.com/IanKnighton/clockifish"
  url "https://github.com/IanKnighton/clockifish/archive/refs/tags/1.2.0.tar.gz"
  sha256 "752f1200a67d48170750bde564b5a18ff41024d65ecf068f3f477bc71a48cea4"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/clockifish/releases/download/1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "a5e8ec2609183cca26d7da3de39af6e1d4c0da82a4039d1854b1f094c8065399"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "a5e8ec2609183cca26d7da3de39af6e1d4c0da82a4039d1854b1f094c8065399"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "a5e8ec2609183cca26d7da3de39af6e1d4c0da82a4039d1854b1f094c8065399"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "a5e8ec2609183cca26d7da3de39af6e1d4c0da82a4039d1854b1f094c8065399"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "a5e8ec2609183cca26d7da3de39af6e1d4c0da82a4039d1854b1f094c8065399"
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
