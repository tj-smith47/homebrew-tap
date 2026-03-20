class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.1.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.1.0/cfgd-0.1.0-darwin-x86_64.tar.gz"
      sha256 "fe6b526b25bf527c9c3f9612f172ecf9525502797c6fb9d8c4875b2e21262dcf"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.1.0/cfgd-0.1.0-darwin-aarch64.tar.gz"
      sha256 "bd38475a9acbae29ceab1fffb7942cee51abefabfbc784f88744bf43e5b7175f"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.1.0/cfgd-0.1.0-linux-x86_64.tar.gz"
      sha256 "3c52a6f54eb3cb231a0aa2fdd44a76fde6ffdcc05adafdaae5476145bc552747"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.1.0/cfgd-0.1.0-linux-aarch64.tar.gz"
      sha256 "9be24b11ddbe51eeb16674f915e8a853d8f3599ea381c085e5cbc38be219f65f"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
