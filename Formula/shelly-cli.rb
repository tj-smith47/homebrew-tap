class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.3"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.3/shelly_darwin_amd64.tar.gz"
      sha256 "22550f863cad7a32b771716ba91fc112fd4f779eaf50123d096fcddc25a19b90"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.3/shelly_darwin_arm64.tar.gz"
      sha256 "7046d5e78af9df4bbea1aa8eacf6faa995b3fedf309a19739b4a251b55698cba"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.3/shelly_linux_amd64.tar.gz"
      sha256 "e4007e36908e8305cee3a41b99969fbe9c3d3519b38c00b97279b2e9adb30985"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.3/shelly_linux_arm64.tar.gz"
      sha256 "fb1db5cd324edc4b5f35f9b32017ca538a181a0111e3f27ad47870098916d131"
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
