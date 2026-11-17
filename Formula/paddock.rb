class Paddock < Formula
  desc "Fast tmux popup for sessions, windows, panes and the AI agents in them"
  homepage "https://github.com/plopezlpz/paddock"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.2/paddock-aarch64-apple-darwin.tar.gz"
      sha256 "2527aadaa8e47a453f345b2f30dd570e12cef5288c1b6849b9fabd296be03baa"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.2/paddock-x86_64-apple-darwin.tar.gz"
      sha256 "d93370c82eff9059efa9aedac6124b89db57b513f04cbc9583e72584622ebd90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.2/paddock-aarch64-unknown-linux-musl.tar.gz"
      sha256 "47afb205430c7255672f97df1708fa12c07bfa5564f6e6c1baafef2d1819bb94"
    end
    on_intel do
      url "https://github.com/plopezlpz/paddock/releases/download/v0.10.2/paddock-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6c8d2bab1c4f2eb02fdf4ec71b6a57e2fed8bbd611fc8ce21fc8516c1299e1c0"
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
