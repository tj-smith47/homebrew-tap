class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.11"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.11/shelly_darwin_amd64.tar.gz"
      sha256 "0312903dc1097ac214dfbde477ba2f44658b3c53838f9e8c82047671d4c45679"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.11/shelly_darwin_arm64.tar.gz"
      sha256 "584e90736a5e6eed0822927c6ccdf837cacf689b976f599920e749a1c4a917a7"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.11/shelly_linux_amd64.tar.gz"
      sha256 "0415c2ff12388e531c6289a91b954fe2b69f16826a89d97daf0e9b9ccbc9ed7b"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.11/shelly_linux_arm64.tar.gz"
      sha256 "0e98dfe0d5769fa57a38df7a1949d4ea4d3c4dd45d7da1c4603bdd629316c26c"
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
