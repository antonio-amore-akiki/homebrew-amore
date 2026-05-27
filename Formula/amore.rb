class Amore < Formula
  desc "Local-first MCP memory backbone for AI coding assistants — Apache-2.0, Rust, zero-cloud"
  homepage "https://github.com/antonio-amore-akiki/amore"
  version "1.0.0"
  license "Apache-2.0"

  # macOS binaries built by .github/workflows/release.yml macos-build job on free
  # GHA macos-latest runners (post 2026-05-27 public-flip). Tarball naming matches
  # the workflow output: amore-<version>-macos-<arch_short>.tar.gz.
  on_macos do
    on_intel do
      url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.0.0/amore-1.0.0-macos-x86_64.tar.gz"
      sha256 "41335315f578652f547326d06a88333b78f675e0fd6a9342b46824fe65b1d0a5"
    end

    on_arm do
      url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.0.0/amore-1.0.0-macos-aarch64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.0.0/amore-gui-x86_64.AppImage"
    sha256 "3e433ae1bf09dfd6e35efef5400bf3e119eb73243d8cda589e1c739e4ce70597"
  end

  depends_on "qdrant" => :recommended
  depends_on "ollama" => :recommended

  def install
    on_macos do
      # macOS tarball contains amore + amore-mcp + amore-gui at top level
      bin.install "amore"
      bin.install "amore-mcp"
      bin.install "amore-gui"
    end
    on_linux do
      # Linux: AppImage is self-contained portable binary
      bin.install "amore-gui-x86_64.AppImage" => "amore-gui"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/amore-gui --version 2>&1")
  end
end
