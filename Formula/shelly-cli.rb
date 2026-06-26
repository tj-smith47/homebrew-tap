class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.9.10"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.10/shelly_darwin_amd64.tar.gz"
      sha256 "cfd8572495758c6c86ab7cf9f25b3074dd2edf35a1cbcedfc1c5946648c435dd"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.10/shelly_darwin_arm64.tar.gz"
      sha256 "74c8aa7ce4c18c401bfa738f5ee71e6873b2348d6f28140e2d6e69c4a6838ef6"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.10/shelly_linux_amd64.tar.gz"
      sha256 "68e936d555131c29819b32ebf98b80bdcc60914e59f471ac121e985fa8b5e956"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.10/shelly_linux_arm64.tar.gz"
      sha256 "5ea04c51e9139c66b4f4e8f0d7aec657cd50116186de6acadeb49a0cb8bc2db9"
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
