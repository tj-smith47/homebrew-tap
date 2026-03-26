class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.7"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.7/cfgd-0.2.7-darwin-x86_64.tar.gz"
      sha256 "1894ee6a8865a2c76d8fd29c7b526e291e6645cbef3c67a6948b1f3e70e3683f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.7/cfgd-0.2.7-darwin-aarch64.tar.gz"
      sha256 "e926e06e02b2effaf29f754cfdbb2ddb15189a424060b5cee3a892b0b7d0f0b3"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.7/cfgd-0.2.7-linux-x86_64.tar.gz"
      sha256 "d760fa895d1cd4c752dd1a0d9cdb8b86ec0763c2938e93bb8749beeed1fe2f35"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.7/cfgd-0.2.7-linux-aarch64.tar.gz"
      sha256 "880785c126a0c3e00e106b554134035d60b93b97c2806006b714e0835548b956"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
