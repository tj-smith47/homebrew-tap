class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.6.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.0/shelly_darwin_amd64.tar.gz"
      sha256 "49b5f86de5278df9c4fbf267a7dfa81b420bd9058c50f07f8e291fc50b5e5460"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.0/shelly_darwin_arm64.tar.gz"
      sha256 "dcf0e0fb2361b808220bdfbb5887fdc9b26b8185a90d8f809a6f986690343388"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.0/shelly_linux_amd64.tar.gz"
      sha256 "9b7d4daf97aec1ff9444c8e2527828e4041ad412ef5e075258a9636319e7de16"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.0/shelly_linux_arm64.tar.gz"
      sha256 "915fcf99ee86ac842f8646d7f42300c2871346e3e9de6f1aec70ac1004826685"
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
