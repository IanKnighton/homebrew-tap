class Skipboi < Formula
  desc "A simple macOS CLI for controlling Apple Music"
  homepage "https://github.com/IanKnighton/skipboi"
  url "https://github.com/IanKnighton/skipboi/archive/refs/tags/2.1.0.tar.gz"
  sha256 "a0865638d836cb54ca8cfdaaffd194ea966e9a8639b185cfec944b18ba2de7a8"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/skipboi/releases/download/2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "a3186baba9f17c7c228199341eb3ad48cee9554dc1c959013d366d243056823e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "a3186baba9f17c7c228199341eb3ad48cee9554dc1c959013d366d243056823e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "a3186baba9f17c7c228199341eb3ad48cee9554dc1c959013d366d243056823e"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "a3186baba9f17c7c228199341eb3ad48cee9554dc1c959013d366d243056823e"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "a3186baba9f17c7c228199341eb3ad48cee9554dc1c959013d366d243056823e"
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
