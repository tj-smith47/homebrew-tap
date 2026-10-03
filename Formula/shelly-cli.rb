class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.13.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.13.1/shelly_darwin_amd64.tar.gz"
      sha256 "56dae7f74b0f2c609eb3228d60c44a21a62ae417f18be2070f57bc44ab439b1e"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.13.1/shelly_darwin_arm64.tar.gz"
      sha256 "c35c81f00cfaa60fa47120548f4295089ce755223c2f65d88e121784249882b6"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.13.1/shelly_linux_amd64.tar.gz"
      sha256 "589bea8d43407a21354bbc2e68afe4a07bb57e0ccf379b8bc35025f05f8c40cd"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.13.1/shelly_linux_arm64.tar.gz"
      sha256 "1ad6778edaab1ded6671136c87382d9d49ff9b513ddd61685ba8903908670146"
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
