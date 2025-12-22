class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.2.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.2.1/shelly_darwin_amd64.tar.gz"
      sha256 "61c2ec633269603ed9fe2b8b1245a45667259b9e88e1bbc9e79050352c780cd4"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.2.1/shelly_darwin_arm64.tar.gz"
      sha256 "299c67544f9c9ac8d40615ae5428281c9459ad06b41e60eddb4feb734c64771b"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.2.1/shelly_linux_amd64.tar.gz"
      sha256 "c901e9444a9d8aa7315cdc3052892fae25aa9d92c7e85d9df286ae0d18f15e72"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.2.1/shelly_linux_arm64.tar.gz"
      sha256 "e2a804bfd66e3ff91d4f5a4d8d57b997838602b55e6b8708dac946a8198d1eb1"
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
