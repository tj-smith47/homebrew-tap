class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.17"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.17/shelly_darwin_amd64.tar.gz"
      sha256 "cc26e69590295e3136934feacd36179d7261d82cb76fc1629083d5b5bff2b98d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.17/shelly_darwin_arm64.tar.gz"
      sha256 "107b1e6b47ddadcb56f54016c2c84237cfa26569a5a732ee4e5862d5bcd8c409"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.17/shelly_linux_amd64.tar.gz"
      sha256 "258b69b178fbdd997ef5f1f586b483971aaa824036a6880aa1406dcda80d849d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.17/shelly_linux_arm64.tar.gz"
      sha256 "c8a9901f78f478587409ad59afa7cb159f382368319e8dc43912af44990f6c00"
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
