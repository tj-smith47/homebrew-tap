class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.13"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.13/shelly_darwin_amd64.tar.gz"
      sha256 "6564e172cb5e4ca1d75a280f69f39fe190681f9971726121c4a03fc61431f727"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.13/shelly_darwin_arm64.tar.gz"
      sha256 "fca11e35319158225fecf1d7fea92eec17e768b537d34d0d7a2cea30f2c9b6a3"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.13/shelly_linux_amd64.tar.gz"
      sha256 "72ab6cae7e769cf15c470519bb6e37d171e4cddad8bede22b79c4b670ad5d942"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.13/shelly_linux_arm64.tar.gz"
      sha256 "c0a852ca893c473c611818ae951f5d2bff6fd2c1e152bca15e1b8daf4b46654c"
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
