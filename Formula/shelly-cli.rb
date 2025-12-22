class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.2.2"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.2.2/shelly_darwin_amd64.tar.gz"
      sha256 "d43f38c5f875fec4ef7c525e2a5867f895f3a22e019f06e18568765e7fc3093a"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.2.2/shelly_darwin_arm64.tar.gz"
      sha256 "11b953cf052abda9d8e920ead5d38ab75cb697f7f47367b3f335a3ddac8d4726"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.2.2/shelly_linux_amd64.tar.gz"
      sha256 "f6f8bb8be33f93f9b6533717f9405d287ca481022dba6561c0ae5e84e99bc3d6"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.2.2/shelly_linux_arm64.tar.gz"
      sha256 "721d6f03a0b52a3bc87603cbf994c91a42e780e6f9a3288b623543c38aeb6596"
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
