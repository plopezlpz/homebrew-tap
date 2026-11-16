class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.8.1/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "6e6057a251f295b601601708405cd952b62b02eec5110031ee6c558e59c8aadf"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.8.1/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "b07854d1c8843f94fc11955857c8feb5ddace13b265619581385ee0de70abcff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.8.1/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ad8f562f433e8fc26b702065cfc42d662f61e5456e2d5191eb55574f75068e2b"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.8.1/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "61a7b26771630948a1370d02e875710c72960dd27c32b2b2953f592aa323784a"
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
