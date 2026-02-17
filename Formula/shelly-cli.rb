class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.15"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.15/shelly_darwin_amd64.tar.gz"
      sha256 "203d3b3582de50336ac2c16c51813e98b792c362476307a72e42393df3ad3054"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.15/shelly_darwin_arm64.tar.gz"
      sha256 "fd0bd3c1df82e581c35a601345fd67d4717e8c928cd5ab1838f4f7025bb948ea"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.15/shelly_linux_amd64.tar.gz"
      sha256 "bf3ce317110077d578f5ecbed7cdd8e30ae334581fb2a275d650e5aee83e1cfc"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.15/shelly_linux_arm64.tar.gz"
      sha256 "1e5654ffb7a48be7548b85bbf4de204d0b34443dae22e432c49dda4b7e80541f"
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
