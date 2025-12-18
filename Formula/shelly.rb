class Shelly < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "1.0.0-rc.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v1.0.0-rc.2/shelly_darwin_arm64.tar.gz"
      sha256 "18b06db8bb8f3e7c1daec2847681a796f6e823db48e6fa548bd4589e0f4f3727"
    else
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v1.0.0-rc.2/shelly_darwin_amd64.tar.gz"
      sha256 "affbd315cd28580c0e03fcea1121233bcbbdc108ae3f1d9a6a01ba431464a09a"
    end
  end

  def install
    bin.install "shelly"

    # Install completions
    bash_completion.install "completions/shelly.bash" => "shelly"
    zsh_completion.install "completions/shelly.zsh" => "_shelly"
    fish_completion.install "completions/shelly.fish"
  end

  test do
    system "#{bin}/shelly", "--version"
  end
end
