class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.5.10"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.10/shelly_darwin_amd64.tar.gz"
      sha256 "4af7f1de3af124b82ab87ca954966397329934144b64c890eb601658360c0d0a"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.10/shelly_darwin_arm64.tar.gz"
      sha256 "31f42d8b08557dc61ad259a4b2a40304e48c9dcbbb220fcb133c6ee8b0906523"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.10/shelly_linux_amd64.tar.gz"
      sha256 "d60b6c8b9d3805c40c01d645c1f7f72f0e5002633d7c972089406d6cb1a1ef75"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.10/shelly_linux_arm64.tar.gz"
      sha256 "13f111c017954dd5a3722e78d5427bd39d66c78c254bb156af8ab507efebb724"
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
