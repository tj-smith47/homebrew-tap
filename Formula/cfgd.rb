class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.4"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.4/cfgd-0.2.4-darwin-x86_64.tar.gz"
      sha256 "1e199acbfcad5d3ff5dd5f931957695bae86b5cd0460d0eedb0584416e4bbd50"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.4/cfgd-0.2.4-darwin-aarch64.tar.gz"
      sha256 "fbf1a37785a6acfaef775bccebb99c9a9885eb839826f754ef07c5d8fb600de1"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.4/cfgd-0.2.4-linux-x86_64.tar.gz"
      sha256 "fe4a2ef4d1c5841c0d0de70126f660dc609a0984ce872f461722c1d95981c922"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.4/cfgd-0.2.4-linux-aarch64.tar.gz"
      sha256 "c798d6da0f83040058d6ccebd3535f9874f328c9601aa8dfaddbe99bb09b923e"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
