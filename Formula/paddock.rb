class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.3.0/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "fedea0ca32c500027ab049e18f0c4e69c024eceae620649ae914be53def7078f"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.3.0/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "f91bb37831d9c458d5ec09e0357a28ab85e86495c29b76df03d44c9f141ddbb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.3.0/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4673f20ca73ae361d95c56effe5b93a4fde5218a8b48a9623c18103263822df3"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.3.0/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bab1ece4fac974032ac5fe3d3cd4970a45ff06cdb6f8094f6521063233af7ecc"
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
