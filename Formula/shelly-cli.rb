class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.18"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.18/shelly_darwin_amd64.tar.gz"
      sha256 "baabcfd42914c3e7961701e97ed06032bc44c9059f70e508b5f4b96fef7c8a6a"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.18/shelly_darwin_arm64.tar.gz"
      sha256 "f1bb925cce73614a2edfe27808b89a99a92a4e013cc7afae62054c21961b7c86"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.18/shelly_linux_amd64.tar.gz"
      sha256 "66b2885e0ffcfebed44ecb5989e6bff36c7ba2597f8d7091d2946651513c27b5"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.18/shelly_linux_arm64.tar.gz"
      sha256 "4a25fc707b2c1330ea09a518b8a20942a187af193ad0fd40b7ba0ed4a592f105"
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
