class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.3"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.3/cfgd-0.2.3-darwin-x86_64.tar.gz"
      sha256 "8b5e405bc02130485a65484f9b602361820e6ed1b4d182198a725da158117051"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.3/cfgd-0.2.3-darwin-aarch64.tar.gz"
      sha256 "7822aea55ba902af51594d71b24d472a4dd3243b2e10c8f7829943d4c401d4ff"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.3/cfgd-0.2.3-linux-x86_64.tar.gz"
      sha256 "f2d1f3993de16c46c1bf3a6df8134ffc7abd3db985ee43af08411d3afdd6ee48"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.3/cfgd-0.2.3-linux-aarch64.tar.gz"
      sha256 "f08055994408a979e677a902f55c4cbffadcedae3c1b61d22cf3419199bc53df"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
