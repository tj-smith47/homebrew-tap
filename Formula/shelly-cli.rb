class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.13.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.13.0/shelly_darwin_amd64.tar.gz"
      sha256 "bce936c71a736f0c4c6c6d487f8dafdd88d0cc9efe39705dfa2a6da39e08a07b"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.13.0/shelly_darwin_arm64.tar.gz"
      sha256 "5099c4a6863c023a721440a5cdfbd0c8e529e1f359e8a034ba473c467dd0b027"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.13.0/shelly_linux_amd64.tar.gz"
      sha256 "9dcb6a080cd9c6ff317e3fcbc8982da8bf38c981c9fba63ebc5fcf9b807a70c0"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.13.0/shelly_linux_arm64.tar.gz"
      sha256 "9c902332e9f6c00ba5c7b35755a9e034a0beb584d2bd5c938a9498213ef67823"
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
