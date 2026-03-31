class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.12"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.12/cfgd-0.2.12-darwin-x86_64.tar.gz"
      sha256 "adc6d2ed836507f52c4dd9dcb731e32c82f65295557698fcd9d551f33d4fd71c"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.12/cfgd-0.2.12-darwin-aarch64.tar.gz"
      sha256 "5ed55eaa5d3dad34ee0d3094a1e593a2651f3a0aaa389f8c82fa99f2a73e4ada"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.12/cfgd-0.2.12-linux-x86_64.tar.gz"
      sha256 "bc9bbedfa8a0869ed9b251cc34485c40a1665695a9ec28c3356ad496e51a7e47"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.12/cfgd-0.2.12-linux-aarch64.tar.gz"
      sha256 "b707e6de0d3c4969ce05f3ba97dc758c7fe6f969756afbbbae303e9b3657d1c5"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
