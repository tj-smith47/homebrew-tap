class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.3"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.3/cfgd-0.2.3-darwin-x86_64.tar.gz"
      sha256 "0a41e324dd4a2fe9183d8ff5da9035be80cb30ca04befb61b5a5045b0327316c"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.3/cfgd-0.2.3-darwin-aarch64.tar.gz"
      sha256 "7b002b18a92a38924c0cd15e2f0da9f06636d261b3117b4c4cd7a12b292d70a0"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.3/cfgd-0.2.3-linux-x86_64.tar.gz"
      sha256 "aa9c6d09ec58b2c0bed76ee43408f6591b494cbb93383ad305fb3b567a643ef0"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.3/cfgd-0.2.3-linux-aarch64.tar.gz"
      sha256 "44c94db724169381c9a37482144b7d8f9ac0bb25d8831b2c193d80dc0901947c"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
