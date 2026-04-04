class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.3.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.3.1/cfgd-0.3.1-darwin-x86_64.tar.gz"
      sha256 "d3d0076d9c2e7d91fb33e584636cd1efb354d2562e74e27ba80c9ed351358f77"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.3.1/cfgd-0.3.1-darwin-aarch64.tar.gz"
      sha256 "5b84efe655b75361ed22d2af8f63631b3c4c98f0a900c5dd205c1c3ab0330520"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.3.1/cfgd-0.3.1-linux-x86_64.tar.gz"
      sha256 "65b0fa294fe394405b4ba49cad73935f248ef0fbf52679feeca8b5a5cfe0b8eb"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.3.1/cfgd-0.3.1-linux-aarch64.tar.gz"
      sha256 "84f931cc9168e461ec2e24e1d33dd297de827675845b106990e02468277b12e4"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
