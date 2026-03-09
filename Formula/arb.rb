# typed: false
# frozen_string_literal: true

class Arb < Formula
  desc "Git Worktrees, Finally Simple"
  homepage "https://github.com/rspencerfink/git-arborist"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.13/arb-darwin-arm64"
      sha256 "96b79ae944e68484b043252c47bbf6db9f15aef28113f4759bcdeae3cb8615d3"
    else
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.13/arb-darwin-x64"
      sha256 "30931e004861a73ee5a56935bd9f2e23c5cf4345b677915c6aceab6db4b3f151"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.13/arb-linux-arm64"
      sha256 "f4b6475d3d16e9a716fbce8cc149216da8227c1096a3a2cc8c95c1c904b4d88c"
    else
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.13/arb-linux-x64"
      sha256 "0902199b70beb02334a10bad86de3d67237bd64d0b5d5e66cec33dfd67e2eb4d"
    end
  end

  def install
    binary = Dir.glob("arb-*").first || "arb"
    bin.install binary => "arb"
  end

  test do
    assert_match "arb #{version}", shell_output("#{bin}/arb --version")
  end
end

