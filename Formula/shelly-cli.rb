class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.19"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.19/shelly_darwin_amd64.tar.gz"
      sha256 "ca38159025bd1fd19bf8fd8d491fce0534c30025eb3e8ff3ba6a4ce4170c05fd"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.19/shelly_darwin_arm64.tar.gz"
      sha256 "ec544e488793ee1a416ab8b80d882b09a33d29d6ec5bec37a48c730899ebce77"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.19/shelly_linux_amd64.tar.gz"
      sha256 "bf950f652174be60abf869a457c99ceaaf6f0eeb27b62461916f178e97822867"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.19/shelly_linux_arm64.tar.gz"
      sha256 "37f56c99e07183c605cd8f0080d5ba29dd707724d670d532ef9c3f35966dba57"
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
