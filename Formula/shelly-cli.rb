class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.0/shelly_darwin_amd64.tar.gz"
      sha256 "b5b90b3d5979eff4542870740c778fc9aa297ab6ec7a60644028261a4a4da8ab"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.0/shelly_darwin_arm64.tar.gz"
      sha256 "cd11dc3411f1c7d543cce6197e8174a609234db7eff985932c4cb88622568c50"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.0/shelly_linux_amd64.tar.gz"
      sha256 "e6b8407355aae3d1af0054c5658e975cc65e3ca59f3edcb92e3a82a42d060645"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.0/shelly_linux_arm64.tar.gz"
      sha256 "bec1a67b306f9ff7ba58f824d1dd5a8cc654da7d04b9bd5234b54012465a2db7"
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
