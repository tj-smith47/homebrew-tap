class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.4.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.4.0/shelly_darwin_amd64.tar.gz"
      sha256 "e317f14acdbd6e945360fdd359a7317e919bf10c346c156da2af537769664f47"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.4.0/shelly_darwin_arm64.tar.gz"
      sha256 "392a11aa5f81763df828fc0a407ebf2f4238f40350d68edc37af4a263bbd890a"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.4.0/shelly_linux_amd64.tar.gz"
      sha256 "fcdf3768c17e831ddffc82b69e24580d603d1ec1a483085c17420f5239d512a5"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.4.0/shelly_linux_arm64.tar.gz"
      sha256 "41ae258ed2aa316461f442fe46df42fb7bcca74b9dcde050685ec3158f15d958"
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
