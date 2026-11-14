class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.14.10"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.10/shelly_darwin_amd64.tar.gz"
      sha256 "05706fc15d0345e2a058d23f22400fde5afc93a6fd312a89d327b1f122aecf78"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.10/shelly_darwin_arm64.tar.gz"
      sha256 "f655c6b7120f9af32c5f25c1a674559bcd3c70233aaba8549d3181df9a643b50"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.10/shelly_linux_amd64.tar.gz"
      sha256 "dfccee278cd3329596ee6fc79bf5252beb57506f478704c613fb8c443b856610"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.10/shelly_linux_arm64.tar.gz"
      sha256 "8384f2c040e8bc4f4f69d07dd3f54d79138b33d5b8dcd59a1bab5ed78cdd43fc"
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
