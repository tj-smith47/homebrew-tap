class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.1/shelly_darwin_amd64.tar.gz"
      sha256 "d7faafe6d6568e48276c2858038d84c802cd403a8edc42705acfa59fd7c3c464"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.1/shelly_darwin_arm64.tar.gz"
      sha256 "cd4d5cef8de5019a87b7205663f4823e036046d3be9bf149a178fcc1bf4b011c"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.1/shelly_linux_amd64.tar.gz"
      sha256 "b901cac177b58d951f2cecd940f8d8e4b545e6c5049ce04776819e2b035372ea"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.1/shelly_linux_arm64.tar.gz"
      sha256 "a3bacb137d44f66654fe7d0196a6c339664fb22ecc4b5a4f74241d77e79b4a6e"
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
