class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.7.6"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.6/shelly_darwin_amd64.tar.gz"
      sha256 "3a5621231b0b793ed1697f2eaed811569dad8720e41c2c1974a1df8cbca264f7"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.6/shelly_darwin_arm64.tar.gz"
      sha256 "138b768926bec07ed12ac45af4333c42ad9b7a1e4c2a5552ddb7d60f991873aa"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.6/shelly_linux_amd64.tar.gz"
      sha256 "e7baeb0011dd13a4d1f4f090804c8b740a373285677277793722c85530393774"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.6/shelly_linux_arm64.tar.gz"
      sha256 "b37d2b8d9f2b04ef7c421256cb0cd3b8313fd46ce239a66d7a043799196335a6"
    end
  end

  def install
    bin.install "shelly"

    # Install completions if present
    if File.exist?("completions/shelly.bash")
      bash_completion.install "completions/shelly.bash" => "shelly"
    end
    if File.exist?("completions/shelly.zsh")
      zsh_completion.install "completions/shelly.zsh" => "_shelly"
    end
    if File.exist?("completions/shelly.fish")
      fish_completion.install "completions/shelly.fish"
    end
  end

  test do
    system "#{bin}/shelly", "--version"
  end
end
