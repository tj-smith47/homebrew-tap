class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.14"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.14/shelly_darwin_amd64.tar.gz"
      sha256 "9044f5e454bbad1d4af8084d99848c235f35be09ff038fc888d221090cbae994"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.14/shelly_darwin_arm64.tar.gz"
      sha256 "cc9b82a2e7c68563e38d71898772c5a5daa938df1385147b35aee5d72f85b5a0"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.14/shelly_linux_amd64.tar.gz"
      sha256 "cc6a29b1f23e9b1496b16c05f12f9854dd1713cac5b582f4e92c825def102156"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.14/shelly_linux_arm64.tar.gz"
      sha256 "be44c326b7dd8ed943e40d1d595b60873e13a5902c9c20986a757efad02d685b"
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
