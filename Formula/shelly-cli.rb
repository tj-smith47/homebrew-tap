class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.17"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.17/shelly_darwin_amd64.tar.gz"
      sha256 "d993405f65463008012b12976432f5853023e291203099bb44c6c3178045e407"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.17/shelly_darwin_arm64.tar.gz"
      sha256 "6060a06f98985047810265be6f191d95c48a02a18ab2c0924ebe83b997a4588c"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.17/shelly_linux_amd64.tar.gz"
      sha256 "e03842bb3b55bdc4e8410e6638fadc7671294f634ab93c93cd3c24f5e932df6d"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.17/shelly_linux_arm64.tar.gz"
      sha256 "3a0a20e9b60ef5bf25f7e76fd45f0f776e2a3dc787c41fa9285a85824b7c636e"
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
