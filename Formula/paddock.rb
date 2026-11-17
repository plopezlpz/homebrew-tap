class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.0/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "94f6f52126e6b81b6729db4fc95b7c485ec6b145b5ea4cd9301bd54ad3b5c69e"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.0/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "95a133c9722e5dd4e5202370e5a1c16c71c39dc617253c4418988a79e76b97eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.0/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "60cf474245c4d6ab0ffe4b050453a97ca007babbd884c1b8f5540f683bc4ce26"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.0/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2b31d0ad624b6a113af2c8bd252d8a8ce01dfdf9bcfa78d25cf0ad0fe9828a5d"
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
