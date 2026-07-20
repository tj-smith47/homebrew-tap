class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.5"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.5/shelly_darwin_amd64.tar.gz"
      sha256 "0b3c714b19756a36bd7cdbecb48463541ca73d56d12e9c2cfb703e526bf2c8f6"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.5/shelly_darwin_arm64.tar.gz"
      sha256 "a615e4d4dc95fb89329512be8702d058f78facc82178f56890d7dd0d410d0f14"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.5/shelly_linux_amd64.tar.gz"
      sha256 "28380d6028226d3f3f5a531aa82d217db63604d58fce5e7439b76de6647b9278"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.5/shelly_linux_arm64.tar.gz"
      sha256 "95f8890a059ff1951f3354da4f325e6979ca3b05278716a91019406548c1e245"
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
