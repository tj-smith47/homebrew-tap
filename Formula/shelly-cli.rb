class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.9.9"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.9/shelly_darwin_amd64.tar.gz"
      sha256 "93924bdfc93d7bea1502cbb62b5a36bd4e3f506e9f7c328ebe82c1d050422a87"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.9/shelly_darwin_arm64.tar.gz"
      sha256 "65e40716f5612a6f2df3d9fb1eda8454b1ec83a8af78cedf0ce1936405790572"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.9/shelly_linux_amd64.tar.gz"
      sha256 "01232ea6635deaa0a6492782329570417cd50067451dfa6c0d52f85be1fc9134"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.9/shelly_linux_arm64.tar.gz"
      sha256 "0365468fd23de26f26b63b9db90cd8315ea6198a0439dea594cfe7081b1cb0ff"
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
