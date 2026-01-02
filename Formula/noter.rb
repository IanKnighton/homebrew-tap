class Noter < Formula
  desc "A Swift CLI for managing notes"
  homepage "https://github.com/IanKnighton/noter"
  url "https://github.com/IanKnighton/noter/archive/refs/tags/1.3.0.tar.gz"
  sha256 "7ec1904a03c0eb13c64f21ae2020198a69deaa914cbe76720f7bb160fb9cdfcf"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/noter/releases/download/1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "deca22fcf0185adef9670020b7cd878ba47837a74d7b5c9ff8e9304251ca575f"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "deca22fcf0185adef9670020b7cd878ba47837a74d7b5c9ff8e9304251ca575f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "deca22fcf0185adef9670020b7cd878ba47837a74d7b5c9ff8e9304251ca575f"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "deca22fcf0185adef9670020b7cd878ba47837a74d7b5c9ff8e9304251ca575f"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "deca22fcf0185adef9670020b7cd878ba47837a74d7b5c9ff8e9304251ca575f"
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
