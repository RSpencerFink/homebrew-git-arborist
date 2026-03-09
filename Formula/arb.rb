# typed: false
# frozen_string_literal: true

class Arb < Formula
  desc "Git Worktrees, Finally Simple"
  homepage "https://github.com/rspencerfink/git-arborist"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.12/arb-darwin-arm64"
      sha256 "c0ce33e0cf78ddbdc8041e8cfb0a55aeff7b34e056300cd4a4ecceb73e41fa8f"
    else
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.12/arb-darwin-x64"
      sha256 "6575f90ed15112ca2b0fddb826b952218ee225bf81c044d9bb0e2be0d84828f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.12/arb-linux-arm64"
      sha256 "0003d9dff4808f29709e4ef0848555e9472fea5cc5f50fa35c85cabc76ee79b3"
    else
      url "https://github.com/rspencerfink/git-arborist/releases/download/v0.1.12/arb-linux-x64"
      sha256 "33c297b3116e18b58742b5d41df5dc4398abe121612a1477e0cbf97d95666e3b"
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

