class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.14"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.14/shelly_darwin_amd64.tar.gz"
      sha256 "d1dc71f42e601494d50dfa69a50ce3b2460f43df32d3bb1d63dfef93719ed40f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.14/shelly_darwin_arm64.tar.gz"
      sha256 "79ca89a7de202d63544d9172a15538e040539758275ff0a1f8d83587d755905c"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.14/shelly_linux_amd64.tar.gz"
      sha256 "4cc2ad15641e7deb3a7a37df5f7468c2129369121849223b04ca3ad5d0f1eb6c"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.14/shelly_linux_arm64.tar.gz"
      sha256 "78ebd03e24ca60488d3bc7dc5b245bd1dab0f4ec6debc3585b8549e9d1549d1c"
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
