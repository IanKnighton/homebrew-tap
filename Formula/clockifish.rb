class Clockifish < Formula
  desc "A Swift CLI for interacting with the Clockify time tracking API"
  homepage "https://github.com/IanKnighton/clockifish"
  url "https://github.com/IanKnighton/clockifish/archive/refs/tags/1.1.0.tar.gz"
  sha256 "9046fe109ec8ee9ece4c359a826b82cb601e705ac54ab6ca08cb2b49897be370"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/clockifish/releases/download/1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "996ca3964202593874d56ecb4333bc6b7f4fc211ac3b1372dd53df03ebfb6185"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "996ca3964202593874d56ecb4333bc6b7f4fc211ac3b1372dd53df03ebfb6185"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "996ca3964202593874d56ecb4333bc6b7f4fc211ac3b1372dd53df03ebfb6185"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "996ca3964202593874d56ecb4333bc6b7f4fc211ac3b1372dd53df03ebfb6185"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "996ca3964202593874d56ecb4333bc6b7f4fc211ac3b1372dd53df03ebfb6185"
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
