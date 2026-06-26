class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.9.11"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.11/shelly_darwin_amd64.tar.gz"
      sha256 "0df1678af829e5f08c55050446e32beb7b2a994bde6192641540b82ff7fe57aa"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.11/shelly_darwin_arm64.tar.gz"
      sha256 "0d4f4c90c69e5b8f07fd7eb51e18d7be8f69378732b66e83eda7184620a3176b"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.11/shelly_linux_amd64.tar.gz"
      sha256 "5a87c34245bf93d6c9402cb18ce74ffae7bb01e4cb52bcefe6892c597d326605"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.11/shelly_linux_arm64.tar.gz"
      sha256 "2716c8ccbd41d0654e734dcdb23368b9ca8f4751e1511b3029b9d43d29f62c2a"
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
