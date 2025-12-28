class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.3.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.3.1/shelly_darwin_amd64.tar.gz"
      sha256 "810efd9ae8e23b4a29af21bd86c5e179f4d02235f635db67874839073e46d0ed"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.3.1/shelly_darwin_arm64.tar.gz"
      sha256 "9af4a078a7b2095230ce42e52ae2c8d69ec490ac948772e3ef9445c74583a949"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.3.1/shelly_linux_amd64.tar.gz"
      sha256 "3bc2b9899310bb73013f2b64cea07a1a271c79b92d34a1d2fd1d9b4fedbcce19"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.3.1/shelly_linux_arm64.tar.gz"
      sha256 "3e16268c84c61615e7eb4ab54daf1762f08f670741fbab3e6eee89654907e883"
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
