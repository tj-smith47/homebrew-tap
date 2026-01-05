class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.5.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.0/shelly_darwin_amd64.tar.gz"
      sha256 "47f86ccce8fdb130cd85327587571b6bd0d928e1a29098d5c24b9cac4bab36f7"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.0/shelly_darwin_arm64.tar.gz"
      sha256 "14150581f5dcc7a05cad07e069b1ae956d3b093e7804d16b41fbc46d406e9483"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.0/shelly_linux_amd64.tar.gz"
      sha256 "9026bbae726e53a55ad751f38bd83203bd2b5203a4f7be24b0cfd3f347212c36"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.0/shelly_linux_arm64.tar.gz"
      sha256 "3f79ce5a8ea575597514503659114901c32eb16da617bd69539d57ea9da2e620"
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
