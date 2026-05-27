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
      sha256 "1932dfd93a4a215ba2e6232a237e473cda813f1e9b4fc139d726d3f04609931b"
    end

    on_arm do
      url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.0.0/amore-1.0.0-macos-aarch64.tar.gz"
      sha256 "087aedc6f16af6386f249a07944d9998440d319b23e0e76010020c708561b5b0"
    end
  end

  on_linux do
    url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.0.0/amore-gui-x86_64.AppImage"
    sha256 "6d0b3f3e13b8a566bd214c1c3cfee09098ba990b01a9fc43b1c62cbec248cc64"
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
