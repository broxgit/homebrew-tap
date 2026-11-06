class LlmRelay < Formula
  desc "Lets Microsoft Copilot Cowork change code it can't reach, through your Mac"
  homepage "https://github.com/broxgit/llm-relay"
  url "https://github.com/broxgit/llm-relay/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "68d050ae3580c4b2b2428ce1f8f7d0a5810188ddb18edfaa1b46b0d568e18435"
  license "MIT"

  def install
    # relay.sh finds the skill it installs beside itself, so the two stay together.
    libexec.install "relay.sh", "cowork"
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
