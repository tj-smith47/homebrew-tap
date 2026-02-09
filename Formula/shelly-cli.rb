class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.1/shelly_darwin_amd64.tar.gz"
      sha256 "55ec72646d63963ce9d28e3ba8567433564b243faab02853b135f04a757e652d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.1/shelly_darwin_arm64.tar.gz"
      sha256 "082d166f289cdf82fcb210a2f31e5fc294d8da87e3049bda0c9af86da7f29604"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.1/shelly_linux_amd64.tar.gz"
      sha256 "3ee2e1b01dbe754c08498295bcd5e98e3ee1745170364f25da5b8c576673924f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.1/shelly_linux_arm64.tar.gz"
      sha256 "fd20dfcc964a01e5db5626f6f3f5a2f5229688f49676b3c429577f35cec3d5dd"
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
