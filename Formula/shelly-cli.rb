class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.7.2"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.2/shelly_darwin_amd64.tar.gz"
      sha256 "7d4b63d957c1e387db55398c3fc8089c92db77bc0bbf81bb1ef08adde22fcc0a"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.2/shelly_darwin_arm64.tar.gz"
      sha256 "73a21a2d0be9593030dfe664a1df6a15c01c724b9ab8f0c479d8880006b5f1d7"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.2/shelly_linux_amd64.tar.gz"
      sha256 "d1b095b29644a42ef700f62fcc3811f6202140b18b6f793b39bbae0940c63cc9"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.2/shelly_linux_arm64.tar.gz"
      sha256 "38041e9110d293631b06f193fd7507d6d165495ad7312a613b197f6c120d0c28"
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
