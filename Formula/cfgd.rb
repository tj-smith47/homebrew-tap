class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.0.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.0.1/cfgd-0.0.1-darwin-x86_64.tar.gz"
      sha256 "1b22a8ca6efe3fa781b24d1c92c30ce1d9dd05430c353d939aeb2bb546a67d60"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.0.1/cfgd-0.0.1-darwin-aarch64.tar.gz"
      sha256 "86fe17d76c08d017a06a529b47f78fb67e9c74de3ba313c93a71ec9051c88c7e"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.0.1/cfgd-0.0.1-linux-x86_64.tar.gz"
      sha256 "684fb40444f3c12d994117a7ff10b7d722cc7db9a83b8eee5e13a92d7755796a"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.0.1/cfgd-0.0.1-linux-aarch64.tar.gz"
      sha256 "0c81d2e40682b746a1ec1bb72c4b538ba5374c91db0dd7ee6330aa47608b186c"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
