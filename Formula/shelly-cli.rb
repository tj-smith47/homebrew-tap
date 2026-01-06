class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.5.9"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.9/shelly_darwin_amd64.tar.gz"
      sha256 "8fb0a14e2e1a75ebb0aaf6a2dea6eded92315f3b42f4ef98629de65c56c3b8f4"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.9/shelly_darwin_arm64.tar.gz"
      sha256 "b5587a92564fbf96de84d6a3f2e3b99c935784cb3dc163a4e9b61c8b1877f0a9"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.9/shelly_linux_amd64.tar.gz"
      sha256 "f8d1e430a5f1f0597f38e1bbb74a78f601f6b9453743eb78d9bdaae298a842bf"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.9/shelly_linux_arm64.tar.gz"
      sha256 "35dc75d97f2a67eddd22d961287bd38905515219306d833b2abf84b066a43fd2"
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
