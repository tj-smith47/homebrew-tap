class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.14.5"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.5/shelly_darwin_amd64.tar.gz"
      sha256 "a0f2a1e7fd478f838fa0f313cc3bf54081477ed16261fc5382d17e2f5e439a9d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.5/shelly_darwin_arm64.tar.gz"
      sha256 "ad24c6ddfd81b9ac8fd838daa20654a920ea20fd7f23c5efbb2b50053d3e9685"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.5/shelly_linux_amd64.tar.gz"
      sha256 "6b8ba4ae967fbdb8806751a5b5c51f3da57bbe127575a1e6b323a71607c67c66"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.5/shelly_linux_arm64.tar.gz"
      sha256 "ffde85a4b2e71223e99d483e70a7b5eaca35480375dc75e7241dee1f3aec19b5"
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
