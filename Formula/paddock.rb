class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.5.0/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "e0bfa51012d738ff3be0dd1e1ddc02b81093aa867370eeb981ec9e596223c293"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.5.0/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "fc11caa3e5893e08921b7a25eabd9a48fb48eeaff1db602a3a337216e1de1106"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.5.0/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6f9cde70ce51a3d98c7097a7bba9ea37f4fe7c2b13ed02f6841a9e5a17c88edc"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.5.0/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b1ab99e06de96d8e8e8c14a290f917a0115bc24487ccb9e885be3654203ee57e"
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
