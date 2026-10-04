class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.14.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.0/shelly_darwin_amd64.tar.gz"
      sha256 "7487b5c2fa402448aa426c61745c607733288675568c94f0a83ec89e280190a0"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.0/shelly_darwin_arm64.tar.gz"
      sha256 "e713741a744e9753d4b95b8c790d1c5ff3cebe47ff538a11604fe1fddbbaab41"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.0/shelly_linux_amd64.tar.gz"
      sha256 "4e57a05a8c7f29d79360f4c9689fdfd6343d0badd49eb2a750dae755a68f105a"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.0/shelly_linux_arm64.tar.gz"
      sha256 "9b43d98bd321e533b12231d19944f1fffe938528095a021282fc6db302965df2"
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
