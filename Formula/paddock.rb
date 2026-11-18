class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.4/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "704d2261a23da6ebaf461941395fce46d83e30d74646b069fd41fa86fc2eb5d0"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.4/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "0320e3ea641749840aa3289513ef5918d03615da895660e2a8e5d490e8e97835"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.4/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "854698f6a3921efa14460a8fd2b447a965f35441173f9b7f744566300699a46b"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.4/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9f22980b839bf159ed8e463d14edaad9855f5c039e006d23ba0c3ca8bf0822ef"
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
