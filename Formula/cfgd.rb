class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.3"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.3/cfgd-0.2.3-darwin-x86_64.tar.gz"
      sha256 "7055a8ae91b1fd4d9ac789450fe49a64c798c81ff6f54e5d1155420a0ffd185d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.3/cfgd-0.2.3-darwin-aarch64.tar.gz"
      sha256 "f73240ce4ac3c81e2708f8d73327d57ded0be3f1d7103bc68157fa69d1e5b521"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.3/cfgd-0.2.3-linux-x86_64.tar.gz"
      sha256 "4886103f9dded29ec42e25ca8b6578380d9bdf7c6650bed09639f92e6a173151"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.3/cfgd-0.2.3-linux-aarch64.tar.gz"
      sha256 "2a5a541fbf497fdd86ace039dcb500521107b73310ec932b24d68195387dd236"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
