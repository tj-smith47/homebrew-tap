class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.3"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.3/shelly_darwin_amd64.tar.gz"
      sha256 "bd034742f075057a8c6c7bf5c72eb991ce22826d5835ac2ba82477a8dfc7d5e9"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.3/shelly_darwin_arm64.tar.gz"
      sha256 "d30e9e9af1a16b11cc2ad06c4e93b76d844a73c56215433eedffe93a0d02a261"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.3/shelly_linux_amd64.tar.gz"
      sha256 "12cc585a457bdf1cd0dec51b9e4f53b0ada9afc488e656a178b68fc01ed08ef6"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.3/shelly_linux_arm64.tar.gz"
      sha256 "a32209cc721d4ead6e1a71adf99e6bb2cf30621188e233ab1b2d62d8242905ab"
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
