class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.3.1/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "30803619766c714db30679382c93aea3c3ccfbf2af4694585edec6f58357f758"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.3.1/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "d47990a398dbda27f26ad891c357d0f6f823294c7c6d55155372ecd7dcbe7684"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.3.1/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e974c299c7d5d83615e7f441b9c875808cc4e31937f6facb21804bb5cdf4dcce"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.3.1/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "84f833451a42c73b9234f5af37c063ecf3ba98bc5ee0981bc784ba63920edd20"
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
