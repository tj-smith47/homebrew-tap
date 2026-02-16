class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.12"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.12/shelly_darwin_amd64.tar.gz"
      sha256 "6f50f459e9270000b308b6103ba68ae9d338df39c2d3a4b420ab8f2dcbdb2fa6"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.12/shelly_darwin_arm64.tar.gz"
      sha256 "11cae716c345f3f06ca95cf0f0354f5dc72be9a29562ee8e81f022ce88758ae0"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.12/shelly_linux_amd64.tar.gz"
      sha256 "1fcb170aee01befd7d6aff0e5ab26ba0abc3590e7cda5030509b73f1614964fe"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.12/shelly_linux_arm64.tar.gz"
      sha256 "18f2a8f8a2a629025e71bf4b49cf0429852e9e3a686c50235084856c1c1df50d"
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
