class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.1/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "a0b3e3a2015c39a249412328ac75e5c9279b911307340611019589bcefd2c457"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.1/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "0b2d64ffa3eb3fdba57cc548b4d090e27b6b65b178be1208e6abb217f0d5d1ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.1/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "130fbf679ac78e2a9de0c8c3aef1bbe7cc60f169ae1bce8722dbde4e1d0b6d71"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.1/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "84852046e521043443a2eaac04a0c49199b313a0b2d85b31bf28c86c27ca3a0e"
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
