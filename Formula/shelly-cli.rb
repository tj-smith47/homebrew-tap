class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.1.4"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.1.4/shelly_darwin_amd64.tar.gz"
      sha256 "847e3bed78dcd23d7b7fb0eb97009baed831321cd202d545af9f6c7f2bcbe59d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.1.4/shelly_darwin_arm64.tar.gz"
      sha256 "2129950a1e4395c8da9bb889f521dcb65b1d4bfebedc304a0ca4d1f0b9add29f"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.1.4/shelly_linux_amd64.tar.gz"
      sha256 "537ce9915d1a84e46b53d31f08d54c7fb5cb28fec4ce64a1eeda9456ebc5f058"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.1.4/shelly_linux_arm64.tar.gz"
      sha256 "7931288f3d09e2b1b95265f8dacfb47d570c98c5d63600fb831cdc147b7778b1"
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
