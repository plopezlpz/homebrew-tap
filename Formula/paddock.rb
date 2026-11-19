class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.6/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "309bc7aaf6c1a5e7035bf8aa96d339816fc754bd81ccc3490118755d11caa072"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.6/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "f42e9e21822e2f2dc5dec14f8b988b2df662bfd124e5407e88098ab49bf60f5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.6/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1f300f235940838f2bdb8b98374eeb0be1f38940eb9bb70179650f1fa5087478"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.6/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "caf1ced577e8fca10f85ba0cee6d2bbae53d94b2e19ae4d17af60e4e69df51ac"
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
