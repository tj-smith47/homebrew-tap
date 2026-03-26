class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.4"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.4/cfgd-0.2.4-darwin-x86_64.tar.gz"
      sha256 "84a2863562b619487223585988e94ce4145f3d050162cab0352e88614ab4deb9"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.4/cfgd-0.2.4-darwin-aarch64.tar.gz"
      sha256 "4c0c95f1f88f736218243805b2fd61bf564cab1c10f902daaff91f0e0c71c6bc"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.4/cfgd-0.2.4-linux-x86_64.tar.gz"
      sha256 "aa0af5746deaa00e3d81003d08da2dbf11f2da5f99757e3dc2627b5946d716e6"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.4/cfgd-0.2.4-linux-aarch64.tar.gz"
      sha256 "8546dc9a6c9da1c836fbb7fd01da97e73f07b1118443c19a73960f86df071227"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
