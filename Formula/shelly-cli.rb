class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.5.8"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.8/shelly_darwin_amd64.tar.gz"
      sha256 "67b9d57a897fdd02b011a99ae7c8c3e696fef2f775b8ac6c48e49ae62485ed75"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.8/shelly_darwin_arm64.tar.gz"
      sha256 "f0959087c6c98cef25e32cb4c641232bb10b65e8f3c21bbf34969552c8dec9cc"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.8/shelly_linux_amd64.tar.gz"
      sha256 "bcbc6187d0d61090d8bc7256eeb745545af1628956dbab046ac85e86f9fff0c5"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.8/shelly_linux_arm64.tar.gz"
      sha256 "c544655e0c1f64d34c425b5d9aec89d94eb4b103890d82724dd53332971bdc07"
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
