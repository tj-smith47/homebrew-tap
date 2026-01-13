class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.6.2"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.2/shelly_darwin_amd64.tar.gz"
      sha256 "c04cfb659ac7ac2d31b23e03333270046d1652bef537926f424d5be84c602722"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.2/shelly_darwin_arm64.tar.gz"
      sha256 "607043df7acb1bc109d39408918752169d8489b7026a1dcfb429eace504dc066"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.2/shelly_linux_amd64.tar.gz"
      sha256 "8237d46466170ba42cb90483b7b9af3f4f4a2d878d6996ede100e048633d851a"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.2/shelly_linux_arm64.tar.gz"
      sha256 "7eb11e46c2a462224d032aabb8949a0fdc276be99ddf1fb4419015f57763aafe"
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
