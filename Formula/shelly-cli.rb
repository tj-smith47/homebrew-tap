class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.8"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.8/shelly_darwin_amd64.tar.gz"
      sha256 "ec4bf08c4ab3c1178d199bb6acbd0247cff123487907da9a8d4d0b91355b0389"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.8/shelly_darwin_arm64.tar.gz"
      sha256 "ab0d628a2d44cae53646f0e6d1021ee55fd6c252c347bb107a7fc64ba6c26425"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.8/shelly_linux_amd64.tar.gz"
      sha256 "2dbac169d0908bfdb4ec25724cb9ba14ea8a1d050be27e2f033fa83aceac2900"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.8/shelly_linux_arm64.tar.gz"
      sha256 "90704d5d901fc83a0eb2dd43ba2401256310aa4b7f7ef9e18462ba97c9b26884"
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
