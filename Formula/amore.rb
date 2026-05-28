class Amore < Formula
  desc "Local-first MCP memory backbone for AI coding assistants"
  homepage "https://github.com/antonio-amore-akiki/amore"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.1.0/amore-1.1.0-macos-x86_64.tar.gz"
      sha256 "d20ca6ef7013fd7f83a6ffa76cca4388a04372a1ab383743635557fb3ed6cca7"
    end
    on_arm do
      url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.1.0/amore-1.1.0-macos-aarch64.tar.gz"
      sha256 "16696a852928f03fce7ea64ac42823cbe94e864f1bc76ce59ebd5f4adf0eb6e8"
    end
  end

  on_linux do
    url "https://github.com/antonio-amore-akiki/amore/releases/download/v1.1.0/amore-1.1.0-x86_64.AppImage"
    sha256 "a5fce56693344289871f4c3102a9f5070691344176f5db806f2bd7ccc0453bf6"
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
