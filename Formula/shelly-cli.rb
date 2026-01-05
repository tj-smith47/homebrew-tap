class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.5.2"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.2/shelly_darwin_amd64.tar.gz"
      sha256 "ea42e8c6a2cfa643f158bb7a6528c6c62a9fd0d42ad6f0b92601159f76cab965"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.2/shelly_darwin_arm64.tar.gz"
      sha256 "6372d6189db2d1913e1a2145bd8bff1d58344a4061d53b5b42ba34c26a333b06"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.2/shelly_linux_amd64.tar.gz"
      sha256 "fc4f2d2e8fecd605e7d3d5e28c6cc5d6768b3512eb5e256bdcd8c68b7cbfef99"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.2/shelly_linux_arm64.tar.gz"
      sha256 "bf689c67c2e74de2bfe1151c6b767065d6afa088d8b0648a31e345aebb3156f0"
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
