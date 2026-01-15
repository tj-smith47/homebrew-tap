class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.6.4"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.4/shelly_darwin_amd64.tar.gz"
      sha256 "3db8dc4b9d56d01c14df9e0bb7fa0aae92d4165ab24efc877e6eb3d0baea2244"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.4/shelly_darwin_arm64.tar.gz"
      sha256 "d9ce1782b4641061693417700a6e3d40d195a4bb5d5f1005e08a3466abff73e3"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.4/shelly_linux_amd64.tar.gz"
      sha256 "916c42cada7e506f586b0682e961ab6d838c1002964a7c510890433ec016f72a"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.4/shelly_linux_arm64.tar.gz"
      sha256 "40f8acabff2c6a02fab5f3b290c89f2e9d7401bb1907a35c6fc560cedfd5c54e"
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
