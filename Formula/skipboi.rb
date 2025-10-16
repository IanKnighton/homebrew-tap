class Skipboi < Formula
  desc "A simple macOS CLI for controlling Apple Music"
  homepage "https://github.com/IanKnighton/skipboi"
  url "https://github.com/IanKnighton/skipboi/archive/refs/tags/2.0.0.tar.gz"
  sha256 "f4eab17a57eb3b1ec157012b637422021678485e1a149afdc706386807a84d2a"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/skipboi/releases/download/2.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "76816118121f591076bf046f104be1c54cc596cddc2619b7fbcdb742886fdb07"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "76816118121f591076bf046f104be1c54cc596cddc2619b7fbcdb742886fdb07"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "76816118121f591076bf046f104be1c54cc596cddc2619b7fbcdb742886fdb07"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "76816118121f591076bf046f104be1c54cc596cddc2619b7fbcdb742886fdb07"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "76816118121f591076bf046f104be1c54cc596cddc2619b7fbcdb742886fdb07"
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
