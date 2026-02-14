class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.4"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.4/shelly_darwin_amd64.tar.gz"
      sha256 "0912fb72c4a2d701217c14beda5322cb80ca86abdf8cc1748a0c27dfcebf56e4"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.4/shelly_darwin_arm64.tar.gz"
      sha256 "23783b6d3073234ba4276fc54c2c05ac8b415ad030b1461526498ab086eb01af"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.4/shelly_linux_amd64.tar.gz"
      sha256 "127ce8018c9d1ab3b118bd26cf99e501c4073db42b476c29c809f40781906934"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.4/shelly_linux_arm64.tar.gz"
      sha256 "bdf979401be1df3cb9d765292f570ac5d164e82df59e9c138088826f184a503c"
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
