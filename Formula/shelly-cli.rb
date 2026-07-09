class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.2"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.2/shelly_darwin_amd64.tar.gz"
      sha256 "365514e8be508558172bea26b5edf32ad7d10df3728b21da16c1fed06dc1fcb6"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.2/shelly_darwin_arm64.tar.gz"
      sha256 "fbc2ed79710a5581a285e62aaa564cf285bd5bce583354aae504de7535133340"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.2/shelly_linux_amd64.tar.gz"
      sha256 "2f9d3cf292a498ba2392e7dd9b4a2405466c841cfabf5f651b7ca7c382b6cf9f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.2/shelly_linux_arm64.tar.gz"
      sha256 "934136d5326eca642628b263dc4d3c1a1664ec16a99c1717e21d04a9822ee2c1"
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
