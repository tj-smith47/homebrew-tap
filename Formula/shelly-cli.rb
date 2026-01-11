class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.6.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.1/shelly_darwin_amd64.tar.gz"
      sha256 "d956f35cbd357cb1d3f9ff5e2062b6bfb900aafb678ed070dcf9548a140d90e3"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.1/shelly_darwin_arm64.tar.gz"
      sha256 "4a5327e4ff67d9e86dbde7c982f246e3ccb6c7388c46353281a51f9a0f3da094"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.1/shelly_linux_amd64.tar.gz"
      sha256 "7bd02cdc0568860f9477f0a86c06c943e1c6d496568d8f2f3b63c2499e96b76f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.1/shelly_linux_arm64.tar.gz"
      sha256 "67e3d8f6aa23628f6696d762be48cd37b3cfcdc264f7a205360c6d44e6a15dcc"
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
