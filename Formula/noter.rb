class Noter < Formula
  desc "A Swift CLI for managing notes"
  homepage "https://github.com/IanKnighton/noter"
  url "https://github.com/IanKnighton/noter/archive/refs/tags/1.2.0.tar.gz"
  sha256 "8b06be5583090727648e3fa434ac12afc8f7e592b29aeb309cad35e61ed579da"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/noter/releases/download/1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "6504f88d6293fc503dd8f667ed1cd4f89d2d45b9a1b6ea5fb52ee7a8b233aea9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "6504f88d6293fc503dd8f667ed1cd4f89d2d45b9a1b6ea5fb52ee7a8b233aea9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "6504f88d6293fc503dd8f667ed1cd4f89d2d45b9a1b6ea5fb52ee7a8b233aea9"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "6504f88d6293fc503dd8f667ed1cd4f89d2d45b9a1b6ea5fb52ee7a8b233aea9"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "6504f88d6293fc503dd8f667ed1cd4f89d2d45b9a1b6ea5fb52ee7a8b233aea9"
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
