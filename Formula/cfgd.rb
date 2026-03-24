class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.1/cfgd-0.2.1-darwin-x86_64.tar.gz"
      sha256 "97ca949d0f1fdc4827ba0278862b32074f0ef9e30ba8b9ed40bf3a6f3a1aa3d3"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.1/cfgd-0.2.1-darwin-aarch64.tar.gz"
      sha256 "8ba0ed899fe0fc6da6bbeecdf4130b0d7cc887b9a4d97bec6d4ea2796ce3d380"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.1/cfgd-0.2.1-linux-x86_64.tar.gz"
      sha256 "2083a3b97a64ae8906ba9abbe18bfa9c555cb8d19a5d73a5a589641368b47712"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.1/cfgd-0.2.1-linux-aarch64.tar.gz"
      sha256 "5085a2faa0c6ca0ab2fb1515076ce9cfcfdbe8f70e16059dc565dfb10f07f630"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
