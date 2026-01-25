class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.7.8"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.8/shelly_darwin_amd64.tar.gz"
      sha256 "dbf7adbc2f0ff50b6a0b33878ccd29cedf849757406ecb4ab381132621973647"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.8/shelly_darwin_arm64.tar.gz"
      sha256 "471636a7ada309a21b19b6cac35e935dba7402aadb456b4d7520b45e6a920ae9"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.8/shelly_linux_amd64.tar.gz"
      sha256 "168fd409944a7e605630f68bbf54fc02db789e715a578fedb1f11dcde5378c1d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.7.8/shelly_linux_arm64.tar.gz"
      sha256 "4c48574c0812fdecfeea8c9f044c18f6a2754f7b85cc254da1b41383d2ed819c"
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
