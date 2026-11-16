class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.8.0/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "62c4961e1761003c7eba304b95cb797c6db3ffc19c39f17371eceb434b139dcd"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.8.0/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "9d431f217b0128930014f56518a353894e3237a287204e763309439ff5d945e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.8.0/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1b9f16bbc6eef757fabf0d918e505552a793620d90f94744249258bba16d3ec0"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.8.0/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5d6f0805a75ac9add2a17b8ab4e3b932de6de1cdce74907df09cdecf87932dc6"
    end
  end

  def install
    bin.install "paddock"
  end

  def caveats
    <<~EOS
      paddock needs tmux 3.8 or later (tmux -V). Add to ~/.tmux.conf
      (prefix a then opens paddock; @paddock-key picks another key):

        run-shell '#{HOMEBREW_PREFIX}/bin/paddock init'

      Reload tmux (tmux source-file ~/.tmux.conf) after installing and after
      every upgrade. For agent state, add agent-status.tmux as in:
      https://github.com/plopezlpz/paddock#with-homebrew
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/paddock --version")
  end
end
