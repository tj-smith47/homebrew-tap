class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.10"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.10/shelly_darwin_amd64.tar.gz"
      sha256 "a5666636bca338cf45b16360ac810a86b40ddcbb50020073923e48dba3c7b5d2"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.10/shelly_darwin_arm64.tar.gz"
      sha256 "bc30bc659cf5ee90f43c8f37d81359cb452bc0b6903c55278208f238784ba096"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.10/shelly_linux_amd64.tar.gz"
      sha256 "9c0ab92497205e2f3e8e0050611a74e93e1ce58e8b72baf3b390bdf8abc52e0d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.10/shelly_linux_arm64.tar.gz"
      sha256 "d3c03011155e26f21fe4fafe0f883c7ec074dc35f4e7bd5e102f0472da9d547e"
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
