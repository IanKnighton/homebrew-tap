class Skipboi < Formula
  desc "A simple macOS CLI for controlling Apple Music"
  homepage "https://github.com/IanKnighton/skipboi"
  url "https://github.com/IanKnighton/skipboi/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "052fa2a58ac011d0b076e7891e3b3a3083eb852319296604383a7fd8de16a225"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/skipboi/releases/download/v1.2.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "c269e1d703b8377465f7ac595adcf7b10fbf1bc48391eb62c831ee776056ef16"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "c269e1d703b8377465f7ac595adcf7b10fbf1bc48391eb62c831ee776056ef16"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "c269e1d703b8377465f7ac595adcf7b10fbf1bc48391eb62c831ee776056ef16"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "c269e1d703b8377465f7ac595adcf7b10fbf1bc48391eb62c831ee776056ef16"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "c269e1d703b8377465f7ac595adcf7b10fbf1bc48391eb62c831ee776056ef16"
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
