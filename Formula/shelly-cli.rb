class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.5"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.5/shelly_darwin_amd64.tar.gz"
      sha256 "6bef24a96dfe55013c1b0b3f88c12aaa3fc92b3fbab80ad529dbd778c95b8648"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.5/shelly_darwin_arm64.tar.gz"
      sha256 "3170450b164d6ccb8d2727ab9af8681a63e0b6abf0654cd2ef8eb6cf036c7c23"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.5/shelly_linux_amd64.tar.gz"
      sha256 "07ad5a3e179b2483a768d6190342688294ab5a4191fb30fdc5b552df85f9a100"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.5/shelly_linux_arm64.tar.gz"
      sha256 "1907ded07f76f9c82f0d99fa25aec2f00b31796753f4e504553d5f53a64ad203"
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
