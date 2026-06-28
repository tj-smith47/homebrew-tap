class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.11.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.11.0/shelly_darwin_amd64.tar.gz"
      sha256 "278c0c1619d69a17ce048b7443340b661101ac1de9b63ffe5bb87a9b61563b53"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.11.0/shelly_darwin_arm64.tar.gz"
      sha256 "33ae36ba7150f174c9e2925383971c3fec83146f9d8997703c92ab00bcc1e837"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.11.0/shelly_linux_amd64.tar.gz"
      sha256 "3f90484bad442703f789064d943db9c29bb1cf00d189e5fa6efc2cadb44bb549"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.11.0/shelly_linux_arm64.tar.gz"
      sha256 "33ff4f2288fa2cf3b1973505cfa69a344f9ec3a71c55a759de2557b48b96e725"
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
