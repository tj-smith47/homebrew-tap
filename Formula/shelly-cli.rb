class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.0/shelly_darwin_amd64.tar.gz"
      sha256 "c63eaf172ded79ab6c6e82125d3d5d28dc037e3a4ef43aa433d9b292508ccf7c"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.0/shelly_darwin_arm64.tar.gz"
      sha256 "4d41c1213881cd249eb3b72fa54a77a5d03f279d0765bd70c2b4357fdf04afb6"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.0/shelly_linux_amd64.tar.gz"
      sha256 "9664b3a51f271185ba7a9bec57bd421924e217437648f918bdb7cd365842a77d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.0/shelly_linux_arm64.tar.gz"
      sha256 "34116e07ed692c705d8a0b5d73d69bf94cdfe1ff0a06324936de61b40562f514"
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
