class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.7.10"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.10/shelly_darwin_amd64.tar.gz"
      sha256 "480a289d81e23d95398ad1247cb9c091144341facd6af052e0b9b63e1e6342ad"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.10/shelly_darwin_arm64.tar.gz"
      sha256 "bf483ac2c5c684db87280b85cec78d0bcaf76fee654fe5b443893475b9b70716"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.10/shelly_linux_amd64.tar.gz"
      sha256 "541ecceee1c1a627aa6fb4926254501bad27b997acf15fd7e35c506bf9ef59d5"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.10/shelly_linux_arm64.tar.gz"
      sha256 "b5ecaf6d61be7be7e4e7d32db756c3f146b76dbb3852b16f6b5289e9c17d07c3"
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
