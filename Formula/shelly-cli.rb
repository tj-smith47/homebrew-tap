class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.14.6"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.6/shelly_darwin_amd64.tar.gz"
      sha256 "01acc0d94edc17bb1bcb112ddb7c85e4b21141890f71c39df53757503e70d74c"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.6/shelly_darwin_arm64.tar.gz"
      sha256 "a2cb839bf125d3cb19e65af7c71f3f3f00d576f3233c52f5858814887c776dfc"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.6/shelly_linux_amd64.tar.gz"
      sha256 "e788b27de27f750afc3725b31e713bf04a176de8ebd5eaf13d7d1f1a51167ecc"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.6/shelly_linux_arm64.tar.gz"
      sha256 "e4b6f7c00394227e06b5cefaef97d5adec60ffeada83cf121f530c32510dca26"
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
