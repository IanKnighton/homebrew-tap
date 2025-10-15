class Skipboi < Formula
  desc "A simple macOS CLI for controlling Apple Music"
  homepage "https://github.com/IanKnighton/skipboi"
  url "https://github.com/IanKnighton/skipboi/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "65d975d62ab7dd27d9f6293e90d679f1a46d6cae82a88ce0aea6d56a07ae6597"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "af686753eee64c90774803772a1ab7132c33091f9eccf1fcc0d4ead1b701f289"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "af686753eee64c90774803772a1ab7132c33091f9eccf1fcc0d4ead1b701f289"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "af686753eee64c90774803772a1ab7132c33091f9eccf1fcc0d4ead1b701f289"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "af686753eee64c90774803772a1ab7132c33091f9eccf1fcc0d4ead1b701f289"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "af686753eee64c90774803772a1ab7132c33091f9eccf1fcc0d4ead1b701f289"
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
