class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.9.0/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "d038cd7a2af8cbe715af5c145f41332e56f5c8c619e82646b6b2401b67dcad3a"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.9.0/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "7658a3fea2073677791a12834d61ac982864d2efa56e9810e4d10bbeeb3fe2f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.9.0/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "aa7c906299a31e5656f1d9878b3239dd5cce3036f35508d997465db2f491f520"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.9.0/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a8de3ee69567bb72c2aa412317f0e8fae197177a0486a0548669e195d149c0a3"
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
