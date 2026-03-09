# typed: false
# frozen_string_literal: true

class Arb < Formula
  desc "Git Worktrees, Finally Simple"
  homepage "https://github.com/rspencerfink/git-arborist"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.14/arb-darwin-arm64"
      sha256 "4b4a76fdd1b58a1778e99f16c94c59ff57f7ff7a04411596903b1cd1d51ecd75"
    else
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.14/arb-darwin-x64"
      sha256 "33192d7b72d0366c1ce18ec10c87887500be772d027b39c4292c0ca986771334"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.14/arb-linux-arm64"
      sha256 "6cccfe214931be42013bf3043f9b74620283f6f2f28236099e8f64aa4b33d18d"
    else
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.14/arb-linux-x64"
      sha256 "bca21478d7dfe184af13e63bab6394f854276ce4a8be59375709dc1ce0b528b3"
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

