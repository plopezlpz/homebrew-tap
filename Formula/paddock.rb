class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.1.0/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "243cc1cf05d64963029d4340d62ef76f731154879d2dc545e4f9e7903a49ce1e"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.1.0/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "a851c6673098812343aa18ac3ab44f684ba7461ee11dae4e09d28fb321f07907"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.1.0/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2f5213d6cebdc749a2f15dafbe55629f1bef779317a465bfacb4fc20b0df9fff"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.1.0/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0d71ea7e2c9f02be019398f45454b55e665ea6f7e59615747ace095be8f1bb2f"
    end
  end

  def install
    bin.install "paddock"
  end

  def caveats
    <<~EOS
      paddock needs tmux 3.8 or later (tmux -V). Add to ~/.tmux.conf:

        set -g @paddock-key 'a'
        run-shell '#{HOMEBREW_PREFIX}/bin/paddock init'

      Reload tmux after installing and after every upgrade.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/paddock --version")
  end
end
