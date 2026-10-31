class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.7.0/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "9a783caee0baf7c939dd3f11b603055330eed28e05d24f3741dbf9aff318225f"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.7.0/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "2083b34fef736263d057824be8e7a6fd4ce8da13a776d03b765a3b676b3ad6fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.7.0/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bda9d40479432d99373eb023019c231e9e9c6b32ec659fd76a35fe202da5d648"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.7.0/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "91794ef203703b204af6494d45892375d944b305ab63601690bea38072e44f77"
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
