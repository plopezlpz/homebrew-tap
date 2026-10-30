class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.4.0/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "294ba118229093f32450f92c2134164cbad2823845f8ac9ad6c8ff0f8662f76b"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.4.0/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "2802515586ea8e4061356506c1ebc3923e3f70119ea5ca7baf09dc26fbee1dbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.4.0/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6a86b43fe75d2dddccb4148e9d16bdfa39dec312138843e32f3506190bed3046"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.4.0/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9d8711236d7d18bf3ac46df546da9de6a6f4b897e9feef889fdc8197506ea88a"
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
