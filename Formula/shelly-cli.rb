class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.4"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.4/shelly_darwin_amd64.tar.gz"
      sha256 "b8aca203875980ef7152c769bc2e7bcdda1c4cfab399a6fba0231491af3e0e45"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.4/shelly_darwin_arm64.tar.gz"
      sha256 "64a5b27abf4c13c4ec94ca97a8c298b3648840402fd7ab6ca7e05e786628d8d3"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.4/shelly_linux_amd64.tar.gz"
      sha256 "257f5bdbb46da2ee159a05a0051f919e7dbe1db109bc064494bc813e880d9e54"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.4/shelly_linux_arm64.tar.gz"
      sha256 "abc88d2ecbb0da965df7d69c97b2ada6485791065713c21e11f7f3e5633485fc"
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
