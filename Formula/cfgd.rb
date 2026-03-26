class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.6"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.6/cfgd-0.2.6-darwin-x86_64.tar.gz"
      sha256 "dd9dc8167258847addbeaa35b03772a20cfc74c6e323e9de8664680feba5ea03"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.6/cfgd-0.2.6-darwin-aarch64.tar.gz"
      sha256 "89636f02235a4e593dcb4dc8f60f41a8e4cff24d5ef85d5b10c02efabe60ec80"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.6/cfgd-0.2.6-linux-x86_64.tar.gz"
      sha256 "ef0f79c5a492bb1c4d61dca05cc0baf45920521ef6c2f9932fbbd6595da11496"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.6/cfgd-0.2.6-linux-aarch64.tar.gz"
      sha256 "ef42749bbde21e05a81fe34781e2152ef88b8ac29b78c3055f3a7e2c0ee71875"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
