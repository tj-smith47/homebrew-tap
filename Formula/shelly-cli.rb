class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.7.3"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.3/shelly_darwin_amd64.tar.gz"
      sha256 "83754f34b4b10b959b3542cf7b6ffc54093f6eb467ae2d8316b4e886aef32c71"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.3/shelly_darwin_arm64.tar.gz"
      sha256 "07f7d82730d6999fdb86d5c94f9e868a139a30ea985b4be6b19468a3db0ee5ae"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.3/shelly_linux_amd64.tar.gz"
      sha256 "17e2f6772414f8b0f24f815561a99d56dc31092cb8a3240ef5f8094edbc37dc7"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.3/shelly_linux_arm64.tar.gz"
      sha256 "074cb23d8f30ee31173aaad4c0def90c35d9ca2da3cbad1bcd255676ce33b2fa"
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
