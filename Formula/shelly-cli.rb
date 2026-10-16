class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.14.3"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.3/shelly_darwin_amd64.tar.gz"
      sha256 "f82ed681a1e0a33aec28c2b4c56be1a7cef229ea455575fb42c492a193cd1fca"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.3/shelly_darwin_arm64.tar.gz"
      sha256 "a8b3dd85cbf548f6e3d3355f3a0dc16ac36ef388a86cfb86d9e4fbb16d732ab6"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.3/shelly_linux_amd64.tar.gz"
      sha256 "f0252d453d748fd405c386092bf7ab9bd869e6b574513c00554985f0c51fb4e7"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.3/shelly_linux_arm64.tar.gz"
      sha256 "206086fa4b8c2b151de7b8f6c60f20b48f88a1f866f24c6cd7481add4dbed18a"
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
