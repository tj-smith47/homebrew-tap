class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.2"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.2/shelly_darwin_amd64.tar.gz"
      sha256 "5e3a7767ef688f70638a83dd7926cb4251f60be007a8649895e5c55c6e94bdd4"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.2/shelly_darwin_arm64.tar.gz"
      sha256 "ed057338f9da3c02f0837c8b3c97169c08fecffb58897f6b0b87dc930b4b87f0"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.2/shelly_linux_amd64.tar.gz"
      sha256 "f4f0544d0e8907f557e84e3b97c2039a607e400878ab9310d752bc1f11225f31"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.2/shelly_linux_arm64.tar.gz"
      sha256 "184350521b30c2239144501a562df2e18c152c1a16f261723fd744e087f7eb3c"
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
