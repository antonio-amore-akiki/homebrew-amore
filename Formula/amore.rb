class Amore < Formula
  desc "Local-first MCP memory backbone for AI coding assistants"
  homepage "https://github.com/antonio-amore-akiki/amore"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.1.0/amore-1.1.0-macos-x86_64.tar.gz"
      sha256 "e2a4bd10859dd1cfd135dc5c914c8dd493888d9f7a3dacaf495921c179eb14e7"
    end
    on_arm do
      url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.1.0/amore-1.1.0-macos-aarch64.tar.gz"
      sha256 "fceda8439bd254a94f024cb35a69f197ca6f2441c667f25aadb6903a4177f191"
    end
  end

  on_linux do
    url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.1.0/amore-1.1.0-x86_64.AppImage"
    sha256 "18709fea32661b0a297231d214e4d59cb7f5df0570d0f676696b91b7b029283e"
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
