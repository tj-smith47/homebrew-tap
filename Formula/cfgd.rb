class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.0/cfgd-0.2.0-darwin-x86_64.tar.gz"
      sha256 "0bd6f1bfeac49f721d8fa4ace0978bed750cc124f374c2ec4c1d9e5d5220ee4a"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.0/cfgd-0.2.0-darwin-aarch64.tar.gz"
      sha256 "a73bf5c36dada5a44b1dfee17d73779464487b4bf955926229c8dd7017216de4"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.0/cfgd-0.2.0-linux-x86_64.tar.gz"
      sha256 "8e5c06a4cfe01d2f12d977d0d4c9be3eba60d566f3176001427a315087fe8bc5"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.0/cfgd-0.2.0-linux-aarch64.tar.gz"
      sha256 "82caac9cb9261ce977db7c4d7c6e449c7f14266800eae3698a8143020ed9cec3"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
