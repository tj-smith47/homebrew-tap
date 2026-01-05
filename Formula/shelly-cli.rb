class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.5.3"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.3/shelly_darwin_amd64.tar.gz"
      sha256 "1d432c3e50f3910878c361a803ac5d2fb6858c82e36d7c30de16c6efacf1c3c4"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.3/shelly_darwin_arm64.tar.gz"
      sha256 "e3d58e18aab0266edf9715a4d009a5b78a5e3c10ca49cccc4ae8923ff5462a66"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.3/shelly_linux_amd64.tar.gz"
      sha256 "35564c080f1937d741b351d94ce0d160d55f7da83016d61a210eb08278727429"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.3/shelly_linux_arm64.tar.gz"
      sha256 "c4a86898b9cd5eb39777cf0c7c09d304dc949b9a77534f5d3b9fd29168dedb2c"
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
