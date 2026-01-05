class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.5.7"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.7/shelly_darwin_amd64.tar.gz"
      sha256 "afdbcfe4c5f90da75ec645108864c590189d19af538a529b47815ddb22ba598f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.7/shelly_darwin_arm64.tar.gz"
      sha256 "f1eb85e84a5b522712d73b90593276c01ed89cf44003676fc3db495bd6f49d8f"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.7/shelly_linux_amd64.tar.gz"
      sha256 "bd0ada110db1fbcdb53237f7b7d2b24649f3a0b1eafc7c9205d545c47336ce18"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.7/shelly_linux_arm64.tar.gz"
      sha256 "d0ea4c0d0f1919a718b134d66e3aa81b0c736e069903f396b2eb08c3d792dd9b"
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
