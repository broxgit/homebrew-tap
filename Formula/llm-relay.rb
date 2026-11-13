class LlmRelay < Formula
  desc "Lets Microsoft Copilot Cowork change code it can't reach, through your Mac"
  homepage "https://github.com/broxgit/llm-relay"
  url "https://github.com/broxgit/llm-relay/archive/refs/tags/v0.2.27.tar.gz"
  sha256 "cf0b99d1a8c11182dce7450da88a0fd6a594a169e35a21d4eb0de5e19b7edef6"
  license "MIT"

  def install
    # relay.sh finds the skills it installs beside itself, so they stay together.
    libexec.install "relay.sh", "ui.sh", "cowork", "claude"
    bin.install_symlink libexec/"relay.sh" => "relay"
    generate_completions_from_executable(bin/"relay", "completion", shells: [:bash, :zsh])
  end

  def caveats
    <<~EOS
      Run this to begin, and again after each upgrade, so Copilot Cowork gets the skills:
        relay start
    EOS
  end

  test do
    assert_match "relay #{version}", shell_output("#{bin}/relay --version")
    assert_match "relay setup", shell_output("#{bin}/relay --help")
  end
end
