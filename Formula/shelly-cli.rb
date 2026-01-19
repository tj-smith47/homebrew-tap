class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.7.5"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.5/shelly_darwin_amd64.tar.gz"
      sha256 "abbe5bc8f246e9f03c1ef6cc6ad7408f91898c0059a123840c138b6fa155e87f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.5/shelly_darwin_arm64.tar.gz"
      sha256 "3c27d654725c4abb7be7aeaf8daa23a2ab82a6f2ca843d5818df1262fd9b4328"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.5/shelly_linux_amd64.tar.gz"
      sha256 "b62f317f51f05c536ac063a7de3d1a1983577038e1eccccba441bf4ba48dcf5c"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.5/shelly_linux_arm64.tar.gz"
      sha256 "85264c6156680bb525f2c53f0b9a2f1d89c2e1275f84f08d026afd1c1c1b2e86"
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
