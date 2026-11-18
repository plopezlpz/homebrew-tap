class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.5/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "e708db760946ae22869fe3b32a33d14eb4b11598cf97bc84bffac3e4138c49c4"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.5/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "9002b2f015aafa2c3103d2b41cd4cb7b175bca5936ccdf18733f033427621d42"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.5/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4dfd2910b6e3a047ed55436d8cb67346718ccf59fd123d37a975f79b33f80ba8"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.5/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "75931335beffea8a615dc14a324a027c52a0215c1d13a637d609e90f7cffc725"
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
