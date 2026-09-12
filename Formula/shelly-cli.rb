class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.12"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.12/shelly_darwin_amd64.tar.gz"
      sha256 "86e74263fc3091979de744f02c2fb3a3930feaa41967ed2635632f36066ff92c"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.12/shelly_darwin_arm64.tar.gz"
      sha256 "8bb03394ca31752d7f065e04e50b4287169dba674b626e4c8dcce05cdcc548ba"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.12/shelly_linux_amd64.tar.gz"
      sha256 "062e3391027112ad517a171b065844f1caba63a0bd4219522d0fd4265b1d03e1"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.12/shelly_linux_arm64.tar.gz"
      sha256 "7add7a9c36a807134c0d92b01d6caa92d450321a4cf2b781688e6ca52fe70765"
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
