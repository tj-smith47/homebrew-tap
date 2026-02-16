class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.10"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.10/shelly_darwin_amd64.tar.gz"
      sha256 "a2639a1de82cd7d39fa42f8350e494ca55b69e7b2ff6735369e579e2fb9f1d1f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.10/shelly_darwin_arm64.tar.gz"
      sha256 "7abd68a106e8314a33158adb448477698b6558b29419ce28a968302211b20503"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.10/shelly_linux_amd64.tar.gz"
      sha256 "a4d544673b5b329c92ecf72cfde7231db81ec23fa4da5ac761d518800bd205cb"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.10/shelly_linux_arm64.tar.gz"
      sha256 "79edb0bb04ec752b1cb1477d703c415a5f27016bdb0676063976003e95624dcc"
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
