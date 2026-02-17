class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.13"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.13/shelly_darwin_amd64.tar.gz"
      sha256 "5f6a705c47d49e9ed249c68bea311e7a4d44db80de6772e437575bc442c7145b"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.13/shelly_darwin_arm64.tar.gz"
      sha256 "ed6079443e02ee2da34aa95acbea23d4ee16c2d483151a60173d5964482df2a4"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.13/shelly_linux_amd64.tar.gz"
      sha256 "131f7f2f8d6b26d942d978775621ad9014ea92a8096f4595f75bceeb8934b0c3"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.13/shelly_linux_arm64.tar.gz"
      sha256 "9570f55023ef40469faa74d9c3d55538d2eba2dbd16cba3d6f3185349a287775"
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
