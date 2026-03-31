class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.11"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.11/cfgd-0.2.11-darwin-x86_64.tar.gz"
      sha256 "41f7ff45424096c4a184c01b068de9d6402746d0838cba64e92b09a680c2f7a5"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.11/cfgd-0.2.11-darwin-aarch64.tar.gz"
      sha256 "dc9753e96e3d69eb7b99590103bc28ce2a27896a4981e5f36adcaac73bffc9e1"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.11/cfgd-0.2.11-linux-x86_64.tar.gz"
      sha256 "80dac1db2b5915ff64e27dced2533d69d3808e427355d9d98c934b2b8b409357"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.11/cfgd-0.2.11-linux-aarch64.tar.gz"
      sha256 "2f4df664d985523b9d7f9f532857d65650d2681066375ae13152fe64e5707d87"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
