# typed: false
# frozen_string_literal: true

class Arb < Formula
  desc "Git Worktrees, Finally Simple"
  homepage "https://github.com/rspencerfink/git-arborist"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.15/arb-darwin-arm64"
      sha256 "9f73093835b59b8e3e148c74170c6bbe3f0d29dd7d658ee755b0d79c9b58e2cc"
    else
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.15/arb-darwin-x64"
      sha256 "19a4f2cc4851c6ef995944c92433f1d0f6a5ba9119c0647d3d26f0ca5b0e4d7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.15/arb-linux-arm64"
      sha256 "1849db8279f1d71e22a67d1a089943dc8c2836f93c8856031302a72d7864b992"
    else
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.15/arb-linux-x64"
      sha256 "25b4627b14a9e1d0612a8ae9bf7c0f8ed2acfb039939ef56417338ae034d0960"
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

