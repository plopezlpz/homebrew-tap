class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.2.0/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "0bef44b18377ee3b60470a2e3f3f8e59f9987a7edc071e19823e87a5e2ff381b"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.2.0/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "9c3c099d41cbd54662ee365111df5d7693c4fa2b8d3ac15a3fd6850cf6f57041"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.2.0/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8939a4f50a23871181094dd42376bab8bccac5b7d4b327d8446b12a2a78862e6"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.2.0/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "642ecea35778477035ea847fa2603754f10e379d4a4ab822c9464b7e656d056a"
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
