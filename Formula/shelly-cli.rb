class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.8"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.8/shelly_darwin_amd64.tar.gz"
      sha256 "8d3d910c8fcf7823411cbd04b68afa84fd28a5a96a588daba79550e20ed25d5d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.8/shelly_darwin_arm64.tar.gz"
      sha256 "99ae8fdb0fab2214f6a47415379612bb385c99718fd8212b35cf5872d9794589"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.8/shelly_linux_amd64.tar.gz"
      sha256 "287590b4919a657d461d60891b3b4531492ece43a007ad43c48bff3b6682036f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.8/shelly_linux_arm64.tar.gz"
      sha256 "e1b5c2b3fe22ad5683bfcbe416484bbcc0ffd86e2c33eec44de6ff99c7a1f0e6"
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
