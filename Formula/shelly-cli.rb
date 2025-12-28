class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.3.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.3.0/shelly_darwin_amd64.tar.gz"
      sha256 "77015c55e668b2c2d4edf7ac0c568fca3196fcf30aad272b5a7791b0432990e8"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.3.0/shelly_darwin_arm64.tar.gz"
      sha256 "ae448107c351663c0a7b3c206ff6ae857143d50ec9c08bbf749a02ef9c8f7b6c"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.3.0/shelly_linux_amd64.tar.gz"
      sha256 "f45ed359746351f036483e16fc3ee9c9b512fa738cb5d1efe706583f962ba1e0"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.3.0/shelly_linux_arm64.tar.gz"
      sha256 "7657bbe7024ba3e48af81db7b74a1df2920825573f48e90518fc4458b88dcfcf"
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
