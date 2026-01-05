class Noter < Formula
  desc "A Swift CLI for managing notes"
  homepage "https://github.com/IanKnighton/noter"
  url "https://github.com/IanKnighton/noter/archive/refs/tags/1.3.1.tar.gz"
  sha256 "fac141935f3f45ceee9c80cc7f5273ae88871c28dc7ca429e2bce2e5888801ad"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/noter/releases/download/1.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "375e5978b424fce433b00f00c066e3c3b638afaa0a82308872db0fc6799454ba"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "375e5978b424fce433b00f00c066e3c3b638afaa0a82308872db0fc6799454ba"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "375e5978b424fce433b00f00c066e3c3b638afaa0a82308872db0fc6799454ba"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "375e5978b424fce433b00f00c066e3c3b638afaa0a82308872db0fc6799454ba"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "375e5978b424fce433b00f00c066e3c3b638afaa0a82308872db0fc6799454ba"
  end

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
