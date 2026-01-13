class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.6.3"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.3/shelly_darwin_amd64.tar.gz"
      sha256 "5eeb95d58254728fd02f786c7535409a4d90f26b99e905d6169a2d0b5ed697ec"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.3/shelly_darwin_arm64.tar.gz"
      sha256 "26875f127981918e5abdbb713c3723a207e104eed917c75d0cf2b279c721bd93"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.3/shelly_linux_amd64.tar.gz"
      sha256 "a555373f77a3dabd52860c98281f63fe2832bf69e27a8d1aa5e7018fb237d18f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.3/shelly_linux_arm64.tar.gz"
      sha256 "e8ae54d19ce253805d6383eb32cd99e5b4b0dadcbb6bf69553e0c6bf49a11aab"
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
