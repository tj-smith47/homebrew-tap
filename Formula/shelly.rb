class Shelly < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.0.1/shelly_darwin_arm64.tar.gz"
      sha256 "44e166b41e4ead11dda3527ab6e794bf1029540159176857e66b2fd959874a0c"
    else
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.0.1/shelly_darwin_amd64.tar.gz"
      sha256 "56c7dfc823af6271d6ca49ae34f878d35e3f96b63b56016e5821d8e966565827"
    end
  end

  def install
    bin.install "shelly"

    # Install completions
    bash_completion.install "completions/shelly.bash" => "shelly"
    zsh_completion.install "completions/shelly.zsh" => "_shelly"
    fish_completion.install "completions/shelly.fish"
  end

  test do
    system "#{bin}/shelly", "--version"
  end
end
