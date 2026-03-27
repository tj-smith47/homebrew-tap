class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.8"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.8/cfgd-0.2.8-darwin-x86_64.tar.gz"
      sha256 "d9bc42381804db80235f1d26d0dc1d260d8848b725c58a589570bad2ef0859b5"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.8/cfgd-0.2.8-darwin-aarch64.tar.gz"
      sha256 "757a6d50b624a1a916e1714f4313ce0ec6d05fa1550fc2f7d3a7fb858031d16d"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.8/cfgd-0.2.8-linux-x86_64.tar.gz"
      sha256 "135a19fb8d7dfa177c070e4354a10a7ec44da277f4c728b7f2cb569820e633d2"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.8/cfgd-0.2.8-linux-aarch64.tar.gz"
      sha256 "b0f7f3638f29d0b489c5c5b134e125839fd48250624c2e37a5cc50e5bcb37040"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
