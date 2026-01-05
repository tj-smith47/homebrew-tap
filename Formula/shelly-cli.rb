class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.5.4"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.4/shelly_darwin_amd64.tar.gz"
      sha256 "bfeff7d2ab00b10b9e17fa2ca306eb6f6807ec84609e130363a35bafe0a596ca"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.4/shelly_darwin_arm64.tar.gz"
      sha256 "cfbce490e1f2d60e157c3717448966ccb64f676dad7eac9277f55799c19cf201"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.4/shelly_linux_amd64.tar.gz"
      sha256 "9f7158737de21b4df90a8a89c92c0398ae4ff61db865ee5797aeef4e386f82b8"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.4/shelly_linux_arm64.tar.gz"
      sha256 "569d5b0c50e10b5144d5684795e7db6d0784ce58ee89fc7c0393bbe6f00f813e"
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
