class LlmRelay < Formula
  desc "Lets Microsoft Copilot Cowork change code it can't reach, through your Mac"
  homepage "https://github.com/broxgit/llm-relay"
  url "https://github.com/broxgit/llm-relay/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "4897e1d4d583f52c7a3818b3a30563b471cdc97efba2a97af6cfb218ec0be148"
  license "MIT"

  def install
    # relay.sh finds the skill it installs beside itself, so the two stay together.
    libexec.install "relay.sh", "cowork"
    bin.install_symlink libexec/"relay.sh" => "relay"
    generate_completions_from_executable(bin/"relay", "completion", shells: [:bash, :zsh])
  end

  def caveats
    <<~EOS
      Run this once, and again after each upgrade, so Copilot Cowork gets the skill:
        relay setup
    EOS
  end

  test do
    assert_match "relay #{version}", shell_output("#{bin}/relay --version")
    assert_match "relay setup", shell_output("#{bin}/relay --help")
  end
end
