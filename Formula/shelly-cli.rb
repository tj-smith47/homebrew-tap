class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.5.11"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.11/shelly_darwin_amd64.tar.gz"
      sha256 "426fafb39341d18b5077cabef3ad2b361394b4b57bbc870b2c6cf03dfa108d60"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.11/shelly_darwin_arm64.tar.gz"
      sha256 "59f9c724a9c49dd3a37953e17c31325a975dd168acefd7b9fb44c4ce10ad4ae9"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.11/shelly_linux_amd64.tar.gz"
      sha256 "1c7fa94e0bbd405af413042f420ac1b9f37e74bb1a9569c1713c23918bf2b657"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.11/shelly_linux_arm64.tar.gz"
      sha256 "5a75c2d4135826a0fe4258ec2703ab583da7b87d5725db7d4a34c128046adfcc"
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
