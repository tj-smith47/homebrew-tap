class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.3.2"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.3.2/shelly_darwin_amd64.tar.gz"
      sha256 "a74c89af19dc98796520f7c921a268128d855a41aba893ede33b3a030dbf52ad"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.3.2/shelly_darwin_arm64.tar.gz"
      sha256 "6bfe2dc07bb2b3b72fe0abfb06286e5569a3fc73a6c8ab5667a4300ec23065c9"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.3.2/shelly_linux_amd64.tar.gz"
      sha256 "ba726a81b2e39f82971ad7546f5924df787d90cdb1b8a2e2ea04e5e84c549f2b"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.3.2/shelly_linux_arm64.tar.gz"
      sha256 "71931251252388cbfe56e72d1d56f142f76628db779f8c41c5e035d27b417aba"
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
