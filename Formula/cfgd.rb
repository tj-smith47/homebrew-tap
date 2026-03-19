class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.8.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.8.0/cfgd-0.8.0-darwin-x86_64.tar.gz"
      sha256 "e1ccc3b6e225b664e73e579e2ac58fdc756d9f908051e6d1761b4ff107e00008"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.8.0/cfgd-0.8.0-darwin-aarch64.tar.gz"
      sha256 "a6477ac25a1ac48c2ecfb765307be863a9a64c44fdd2c630d9b554e2f7fd4b49"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.8.0/cfgd-0.8.0-linux-x86_64.tar.gz"
      sha256 "eb8b6c78e4d17f4cc687f7309471d6c4107cc3001570267471f4b698c2749105"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.8.0/cfgd-0.8.0-linux-aarch64.tar.gz"
      sha256 "21fcab0a4efe9dbe2780948dcd03fffb70939364cc98a496814da57e5d30e030"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
