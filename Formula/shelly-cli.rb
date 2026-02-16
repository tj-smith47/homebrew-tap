class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.7"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.7/shelly_darwin_amd64.tar.gz"
      sha256 "01ee227d099bbf02c04d4a1762b51f56104cc73105df32fbfbcd73a9a169628f"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.7/shelly_darwin_arm64.tar.gz"
      sha256 "cbb889642c9d89a6f02b4415b70d5b4b228063fe85c10829c291a36665f0329d"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.7/shelly_linux_amd64.tar.gz"
      sha256 "22e7cb343d30e4a0851351c74002f7c344837c3f5e08a79f7915cafc4b04a194"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.7/shelly_linux_arm64.tar.gz"
      sha256 "4777740eb62d3f7641b17af65baf3eb7b064d9e56370190dc8e42ef8faafd36a"
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
