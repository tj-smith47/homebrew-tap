class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.7.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.1/shelly_darwin_amd64.tar.gz"
      sha256 "02d831c7e792989ad9ffe61c144901c48ebf03e8d92d8bfaf6de3ce23a718a91"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.1/shelly_darwin_arm64.tar.gz"
      sha256 "625075127740caa052f447ba2ad1f97d87a28b9059015fe8306ce5341489c87f"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.1/shelly_linux_amd64.tar.gz"
      sha256 "e2b69618fee00766134d36813d846b7269fdd30f71a5263dc2880f5328384136"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.1/shelly_linux_arm64.tar.gz"
      sha256 "40e91e5d894de4171ddbea9451d664ac61482e69ad04910f570877e156305a61"
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
