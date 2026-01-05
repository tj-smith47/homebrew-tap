class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.5.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.1/shelly_darwin_amd64.tar.gz"
      sha256 "3c1606e4a88e29df766ac1febf156992c448bbcc761f1112819d80df45467ebe"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.1/shelly_darwin_arm64.tar.gz"
      sha256 "a1f53c921468364144a5026a5ffd32e14afe38b6a78b03e2ae46e8238690f7e9"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.1/shelly_linux_amd64.tar.gz"
      sha256 "39e2e2dcddf6e283680532ac4dbd8bae1ade2bdf0ab70a8ef21a14de134b4a41"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.1/shelly_linux_arm64.tar.gz"
      sha256 "da749187bc62607670efbb8370e527ed7a5688038ce7fce0c50e9c515235dce3"
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
