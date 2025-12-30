class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.4.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.4.1/shelly_darwin_amd64.tar.gz"
      sha256 "ecccbc026fcc24948513b026aa8c05a2525d6ce912370b0c202cfd6fce30c2c9"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.4.1/shelly_darwin_arm64.tar.gz"
      sha256 "9c34a687bca19ee7954b7633f53f0d8d70d98ad6e26cf2f5046a00464c3a8af5"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.4.1/shelly_linux_amd64.tar.gz"
      sha256 "dc935c41b3a4e546e0fac99bfd404f61e9a16af68c126f7453124043ad1281e4"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.4.1/shelly_linux_arm64.tar.gz"
      sha256 "bd1abc1e6724d7558e4db0e37abcd85d7b33dba951f55bff4fb1629b212b78b9"
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
