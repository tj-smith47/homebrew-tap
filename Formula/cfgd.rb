class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.3.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.3.0/cfgd-0.3.0-darwin-x86_64.tar.gz"
      sha256 "0a3635f37a718a771edeb7b5aba06fd602173da714866f4dee8e11fc614e7744"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.3.0/cfgd-0.3.0-darwin-aarch64.tar.gz"
      sha256 "cc7c39806e197029b3d4d10ee57cc3a70160c6e384c0a1acc78def8bafe93f75"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.3.0/cfgd-0.3.0-linux-x86_64.tar.gz"
      sha256 "60069338e91219e6fe316dbb76415d61370c23c8acebb13c123046f7914d75a8"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.3.0/cfgd-0.3.0-linux-aarch64.tar.gz"
      sha256 "09f088f0e43da5a623ce1948f631569024b6064298452fd3e726680147f39bab"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
