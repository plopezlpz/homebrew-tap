class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.6.0/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "edf3599ab5fd7249bb5a1a3189535c3dcb031b67dc861f06015c404521dd7cbe"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.6.0/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "4a5ddbf54ac1aea05b8fc7fea77be2fc7af9e5f0410c914b9e8fff245efddd1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.6.0/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "aadb4ee711bf81a0c82fca54e327e9047ebadb5426d47873e619fb284e5381bd"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.6.0/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f05929fe46a8929ebb6fcb62d50f042f4f1f2b43a0f5681d1871a7df9536e009"
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
