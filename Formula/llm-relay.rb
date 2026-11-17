class LlmRelay < Formula
  desc "Lets Microsoft Copilot Cowork change code it can't reach, through your Mac"
  homepage "https://github.com/broxgit/llm-relay"
  url "https://github.com/broxgit/llm-relay/archive/refs/tags/v0.2.29.tar.gz"
  sha256 "9cd8527b7979df428e5c2f37245c602a4221f0dba4c8e89db2859c1008fece1d"
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
