class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.9"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.9/shelly_darwin_amd64.tar.gz"
      sha256 "44bd755d99ca24a6277a711db7009e930fd6a7085f3be3698715ee450a6428d9"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.9/shelly_darwin_arm64.tar.gz"
      sha256 "d45a2ffca7a4afb4164064326d1cdf6c0274acf6e87c220331c41f34e5f46ecc"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.9/shelly_linux_amd64.tar.gz"
      sha256 "af6a2c026e0d488acc4b1884e90b37ac2983cf9fdc7799f3041670d5ef7f973e"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.9/shelly_linux_arm64.tar.gz"
      sha256 "fc049b03919a487a4bae0ba403b070b9a247fa0a0bfe1a5532a894dc28e99be6"
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
