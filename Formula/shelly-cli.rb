class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.6"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.6/shelly_darwin_amd64.tar.gz"
      sha256 "f667a12867bb32d50eb1ed7c4e24d01a54638884097e06a5101c6371333b3915"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.6/shelly_darwin_arm64.tar.gz"
      sha256 "5d0752c61877f1d0f717476330e68de0e34dcf060612624d205edc42f1dcb9db"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.6/shelly_linux_amd64.tar.gz"
      sha256 "e48ad0d62d10ef83abac91b24ae1bf0cfc1ddfa3c92cbabcdd277e98e85346be"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.6/shelly_linux_arm64.tar.gz"
      sha256 "63283e3b8a6883e46d877398ab456c933a18988a803132670e397288d3f6f5d1"
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
