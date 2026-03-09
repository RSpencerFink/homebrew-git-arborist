# typed: false
# frozen_string_literal: true

class Arb < Formula
  desc "Git Worktrees, Finally Simple"
  homepage "https://github.com/rspencerfink/git-arborist"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.11/arb-darwin-arm64"
      sha256 "efcffebef060a31a5c91103df006fe432ca2fc23594da5fc2825d919c8487ccb"
    else
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.11/arb-darwin-x64"
      sha256 "0dbc31e1a3da31a791913a0ec571c15201748fee6a4f72ce04928130f5831348"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.11/arb-linux-arm64"
      sha256 "d3c45c82032738fd69a91f7b52168dbc51d422dcbd4523e52ceaed9ad702ca81"
    else
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.11/arb-linux-x64"
      sha256 "a851a75210df79cc0b5b7aeb29e0527b0bd14333e2b33e7709b8c2845f139771"
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

