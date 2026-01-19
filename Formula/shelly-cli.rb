class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.7.4"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.4/shelly_darwin_amd64.tar.gz"
      sha256 "6d9c6a6ef0f17abc99cc6d518a0a92a3533d724c10a8f4d42d6789d4c7e48b02"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.4/shelly_darwin_arm64.tar.gz"
      sha256 "a74ac687ca4c5e74bc484db2985b354c1757537c1d7b6414c1d1680026bb545a"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.4/shelly_linux_amd64.tar.gz"
      sha256 "94e94ce99ce40c3d37b3b47cfc855a8bdafef7a06043109cebe2a48f4ded618f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.4/shelly_linux_arm64.tar.gz"
      sha256 "7ee2878274b2c193817c74a93668b447bcc888b9cb2a3d107863842a8e7a4c30"
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
