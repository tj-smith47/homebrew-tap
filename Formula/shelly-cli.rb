class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.2.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.2.0/shelly_darwin_amd64.tar.gz"
      sha256 "7a03dafa0776c615ca60afee7c7bf16567aa87d25307e4aff7441798514ca593"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.2.0/shelly_darwin_arm64.tar.gz"
      sha256 "6ebf65c54e97c796402736ace9b4bb58195a10b43b2bd04d908f7238e83c26eb"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.2.0/shelly_linux_amd64.tar.gz"
      sha256 "aa5af40eb77bd7af1bc3080477634d495d963c38220c8bccca8e6593bb52005b"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.2.0/shelly_linux_arm64.tar.gz"
      sha256 "89ad09e0fc55bf39275436008c917863fdb4ef5d207330503b1a99e607d96d5f"
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
