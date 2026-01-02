class Noter < Formula
  desc "A Swift CLI for managing notes"
  homepage "https://github.com/IanKnighton/noter"
  url "https://github.com/IanKnighton/noter/archive/refs/tags/1.0.1.tar.gz"
  sha256 "7781d4c0e8ee6dc73292d2088c42a6e5880b9ece031a3428ca68a382e94f4fd8"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/noter/releases/download/1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "885589101af7aec4243ead4166791b56ce0467ffcfa4a500de072bc045d1729b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "885589101af7aec4243ead4166791b56ce0467ffcfa4a500de072bc045d1729b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "885589101af7aec4243ead4166791b56ce0467ffcfa4a500de072bc045d1729b"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "885589101af7aec4243ead4166791b56ce0467ffcfa4a500de072bc045d1729b"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "885589101af7aec4243ead4166791b56ce0467ffcfa4a500de072bc045d1729b"
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
