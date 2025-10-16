class Skipboi < Formula
  desc "A simple macOS CLI for controlling Apple Music"
  homepage "https://github.com/IanKnighton/skipboi"
  url "https://github.com/IanKnighton/skipboi/archive/refs/tags/1.2.6.tar.gz"
  sha256 "4e08a9f5aadadfd56b5e2687204671e401147a3410593752ee6ccd9af18e4578"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/skipboi/releases/download/1.2.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "590f998ba5c0b17f419acdc6f5695d78a24abd428861aeed9893e99a9c2ce082"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "590f998ba5c0b17f419acdc6f5695d78a24abd428861aeed9893e99a9c2ce082"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "590f998ba5c0b17f419acdc6f5695d78a24abd428861aeed9893e99a9c2ce082"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "590f998ba5c0b17f419acdc6f5695d78a24abd428861aeed9893e99a9c2ce082"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "590f998ba5c0b17f419acdc6f5695d78a24abd428861aeed9893e99a9c2ce082"
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
