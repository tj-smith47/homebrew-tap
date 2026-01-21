class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.7.7"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.7/shelly_darwin_amd64.tar.gz"
      sha256 "fd933ebd05c73815a11c69ac46d6a478e7943f48ec04b0245a35935727ee5314"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.7/shelly_darwin_arm64.tar.gz"
      sha256 "fac79c9826ec142fd811c16e51e5dab669829e8961883bcea9a5cbdd47ef0467"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.7/shelly_linux_amd64.tar.gz"
      sha256 "b4cd98322f888444efb5dd7a7d0ae487a471ede27b74d27657eb0ae74c6b1f34"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.7/shelly_linux_arm64.tar.gz"
      sha256 "3d2f1c2da2d33d6c8d396326be0c2be4cd8d75598a651937aba5afff0596f0b3"
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
