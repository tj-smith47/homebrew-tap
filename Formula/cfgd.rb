class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.9"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.9/cfgd-0.2.9-darwin-x86_64.tar.gz"
      sha256 "3f2dcf9a7463757e38746a863afd0c6b403bd7a9ae3f009ddcc209b01f477977"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.9/cfgd-0.2.9-darwin-aarch64.tar.gz"
      sha256 "5e01b8a3d1ffd1d90666d584138f8290d725704bd553596d52e381a65f502432"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.9/cfgd-0.2.9-linux-x86_64.tar.gz"
      sha256 "1e4425e0d53dfe0a330c134fa6607ef02d99a6ed84f13298a9f2e988dda60744"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.9/cfgd-0.2.9-linux-aarch64.tar.gz"
      sha256 "3a242af2feaaf31c08ce9860e46808dbdbbee28a0da3e716879914273f43e07c"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
