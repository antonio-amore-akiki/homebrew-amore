class Amore < Formula
  desc "Local-first MCP memory backbone for AI coding assistants"
  homepage "https://github.com/antonio-amore-akiki/amore"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.1.0/amore-1.1.0-macos-x86_64.tar.gz"
      sha256 "51d1a7e193bf49ee45d9bf2777ac83c210aa606be152307ca6d7cc6551950816"
    end
    on_arm do
      url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.1.0/amore-1.1.0-macos-aarch64.tar.gz"
      sha256 "078c2c11b031d64364abf2f0d963a97796b4a9b4cb9c09a79aa6910931ded2c7"
    end
  end

  on_linux do
    url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.1.0/amore-1.1.0-x86_64.AppImage"
    sha256 "8fb7ea9b4b08c0dbde91981ebb418fb00cff3ac23d26f95e6814824b388a4512"
  end

  depends_on "qdrant" => :recommended
  depends_on "ollama" => :recommended

  def install
    on_macos do
      bin.install "amore"
      bin.install "amore-mcp"
      bin.install "amore-gui"
    end
    on_linux do
      bin.install "amore-1.1.0-x86_64.AppImage" => "amore-gui"
    end
  end

  def caveats
    <<~EOS
      Amore installed. Run 'amore-gui' to launch the wizard.
      First-run auto-wires Claude Code / Claude Desktop / Cursor / Cline / Continue.
    EOS
  end

  test do
    system "#{bin}/amore-mcp", "--version"
  end
end
