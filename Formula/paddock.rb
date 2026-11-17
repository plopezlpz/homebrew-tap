class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.3/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "d6685684016a24fbed47cd288437c39367d5dcba19964a5aea4ef94fdab10c1d"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.3/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "6917af0192a52430afbad6f100a03c07cc30eda7bab90994621d5caa9420cd08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.3/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0765195b70849552f1c4a572bce7c7193aada20d376c2c31e8ce4fb6e4e89486"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.3/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fe0e32272c4c05da522d56b7a83db87aab3d50784b6d332dfe19247ee058007e"
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
