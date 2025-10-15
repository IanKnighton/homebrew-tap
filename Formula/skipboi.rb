class Skipboi < Formula
  desc "A simple macOS CLI for controlling Apple Music"
  homepage "https://github.com/IanKnighton/skipboi"
  url "https://github.com/IanKnighton/skipboi/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "4e836581a74842b09caa4da48be75611f133444520451c4494a3557863e32108"
  license "MIT"

  bottle do
    root_url "https://github.com/IanKnighton/skipboi/releases/download/v1.2.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "ba8c0428f81f892ceec78f9a9e65d988819cdc54df6b031f2244dbd6f05d2ff3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:    "ba8c0428f81f892ceec78f9a9e65d988819cdc54df6b031f2244dbd6f05d2ff3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "ba8c0428f81f892ceec78f9a9e65d988819cdc54df6b031f2244dbd6f05d2ff3"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "ba8c0428f81f892ceec78f9a9e65d988819cdc54df6b031f2244dbd6f05d2ff3"
    sha256 cellar: :any_skip_relocation, x86_64_sonoma:  "ba8c0428f81f892ceec78f9a9e65d988819cdc54df6b031f2244dbd6f05d2ff3"
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
