class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.7.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.0/shelly_darwin_amd64.tar.gz"
      sha256 "eff3cea294e1acad9019cb48a277d6a1f8c232496be53b77e0a22cfa50964bce"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.0/shelly_darwin_arm64.tar.gz"
      sha256 "0d97ee72bb0c21ae8d354d04f6da352b7227b0095e60b00dbe33a47e34b71fec"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.0/shelly_linux_amd64.tar.gz"
      sha256 "fa3979d74d42f8dfb56975a07a1be4bf63a55150ea258e7cc7985e28d2c4def5"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.0/shelly_linux_arm64.tar.gz"
      sha256 "3339a846277688aebc8bf724cc6d0a5e5f37182e2e8ccbe0dd0c2f226c20f405"
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
