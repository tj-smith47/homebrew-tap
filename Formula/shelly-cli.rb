class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.16"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.16/shelly_darwin_amd64.tar.gz"
      sha256 "6a209593eb2308929f2b0b2c695cc9133f65897b16fb1a73b2751f577fb23752"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.16/shelly_darwin_arm64.tar.gz"
      sha256 "28d243bdc4af02ee4fa1f3ae0af53c8809755883a82da030b9498f417d87e46b"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.16/shelly_linux_amd64.tar.gz"
      sha256 "bc1997546763c7bce0816bc345164390421af5d5229d2d740ce82222e7fbfaf4"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.16/shelly_linux_arm64.tar.gz"
      sha256 "496fdc2fa0b337e5efc4e8a7577c194c3746252cb9783d2281a573ba80b54a16"
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
