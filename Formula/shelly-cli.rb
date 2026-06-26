class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.9.8"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.8/shelly_darwin_amd64.tar.gz"
      sha256 "5878f1539a795ee94e819e9987d9cebce759bfd3ece5bbf8ea7f496514893227"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.8/shelly_darwin_arm64.tar.gz"
      sha256 "4afc294904970e3ac08f113cdca57f7a7ddd3444823333b60286833948b1df2f"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.8/shelly_linux_amd64.tar.gz"
      sha256 "a53fd67bd63eb21b3f2a234798309d1485cb4601dd05e8ef2b6ef20a0ec7fa99"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.9.8/shelly_linux_arm64.tar.gz"
      sha256 "a24f5c7754e525e2e95a3f1c4fe9b67027d3dc560b58f9ca7b2eb29dc356c1dd"
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
