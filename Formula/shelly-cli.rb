class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.10.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.10.0/shelly_darwin_amd64.tar.gz"
      sha256 "cfc0e64470612ed01ccc68f53cd207d3ea1af2f1cba8f89f4357d49b257ef34f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.10.0/shelly_darwin_arm64.tar.gz"
      sha256 "5b4231015608e8f5645e109ff6f53accacabdccd19c57784109a84fd5568f568"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.10.0/shelly_linux_amd64.tar.gz"
      sha256 "ca5bb16a297421f3532debda4d8f79778977faf2ded538e7fa1d437bb3f6887a"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.10.0/shelly_linux_arm64.tar.gz"
      sha256 "5a1cc520b35ce0bd28858d427266019329fc1ca07dedf7b56a56aaf346a218bc"
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
