class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.14.7"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.7/shelly_darwin_amd64.tar.gz"
      sha256 "632bb31aa6cf0f5d55c67a69d31bf0e80200c9e94fc3eaca5d22999c088d33fd"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.7/shelly_darwin_arm64.tar.gz"
      sha256 "36382155dfec7934f435d7d50f61679a4e6302e17d1308bbec630b0c95e41016"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.7/shelly_linux_amd64.tar.gz"
      sha256 "d2194ad6c0b85ee22b3c623c8fc2c181beccf7c2d0cfa50d1a1fca00d25afa4a"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.7/shelly_linux_arm64.tar.gz"
      sha256 "6cae59e4f76214bdcc3ea7d03fdef4dbbac6df94186880c7e10c21aa8c189267"
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
