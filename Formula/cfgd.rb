class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.10"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.10/cfgd-0.2.10-darwin-x86_64.tar.gz"
      sha256 "71a1eeba0d07411fdec592bb42919a17e6eb4dc52421b7f05ba94e2f712046d0"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.10/cfgd-0.2.10-darwin-aarch64.tar.gz"
      sha256 "6c1e9df3e091a9be4531ae7fd6e8eb77d6060c4439aa10e7537f96cf75568a01"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.10/cfgd-0.2.10-linux-x86_64.tar.gz"
      sha256 "5fb784f50aa6f036d46aaf0625ea238bc06df9e18ed12fb7e0ee0ea06e835b2f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.10/cfgd-0.2.10-linux-aarch64.tar.gz"
      sha256 "a3dda4ea9349c31fbc0db6ea54284b3741a8bb5c1dc6b02dc5d486571ddaf144"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
