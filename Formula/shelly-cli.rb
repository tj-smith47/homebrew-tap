class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.1.0/shelly_darwin_arm64.tar.gz"
      sha256 "7fa56ee28b6decb470329471f718ab0812689862c66918d83232c341a1f9ad79"
    else
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.1.0/shelly_darwin_amd64.tar.gz"
      sha256 "5f4a74c21c23ba8563ac2a1379bc87fd051d199f110747622f64e5aa6a4a4a1e"
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
