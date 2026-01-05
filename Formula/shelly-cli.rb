class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.5.6"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.6/shelly_darwin_amd64.tar.gz"
      sha256 "317fa31a5a6c5bccdca8d873b1477ff0fa11dd50f383cdf23d881b8ca070a19d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.6/shelly_darwin_arm64.tar.gz"
      sha256 "ed4747698575ee77f868b7e687a6038987f410aa1367076204786ba53cad6813"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.6/shelly_linux_amd64.tar.gz"
      sha256 "e525fc7b0db5958cfebfee7b7b269cf67a32fda26ad8c5f6998ab45746600f69"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.6/shelly_linux_arm64.tar.gz"
      sha256 "65c824d4f98f745c4629e826f402b3510536cc3b5a7367b2cd8e287d865d7098"
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
