class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.14.8"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.8/shelly_darwin_amd64.tar.gz"
      sha256 "35aa55434156df089d1e2742117423c64a6a9d10692f70d66451e712fee9048d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.8/shelly_darwin_arm64.tar.gz"
      sha256 "0fd4b7b4ca840dd10ddbc6f280bbeaf98527bae973100511800502db6ddc3b07"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.8/shelly_linux_amd64.tar.gz"
      sha256 "5d98f73a22d95d46c278ed542d0fd71f7ea7b69e0ebe152d8bef5531fea76b61"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.8/shelly_linux_arm64.tar.gz"
      sha256 "9c9b83fd7d41a2425eb96ade8e879e93d8e89240968ff3e98ddb1a8de8d639f3"
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
