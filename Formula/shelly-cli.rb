class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.7.9"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.9/shelly_darwin_amd64.tar.gz"
      sha256 "21b9e6040aa04af898db52ecf145f478b4acef6d93293a5fa621fd91a676647c"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.9/shelly_darwin_arm64.tar.gz"
      sha256 "6d423dac61d1ac3a2f2084c0569b295baccf46b4033b88d063a898ff4d8c1cce"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.9/shelly_linux_amd64.tar.gz"
      sha256 "893f634c8cf3caf874f155b5f14ef18174eb1a672a4a644b87846bc31ad0d0e9"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.9/shelly_linux_arm64.tar.gz"
      sha256 "adb5eefd419f5ccf42ae0dac159d81b660015295f73e27cf0942f6c562000c98"
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
