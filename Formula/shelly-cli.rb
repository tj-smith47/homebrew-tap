class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.6"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.6/shelly_darwin_amd64.tar.gz"
      sha256 "fbaf5291c76be6702fe13ff255fd6221d4b459bfcf2f74a115306d0c29227626"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.6/shelly_darwin_arm64.tar.gz"
      sha256 "11162d8af8372d6b7901f09bfeebfabf5cf4316c8dced4135cce26385e274d5e"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.6/shelly_linux_amd64.tar.gz"
      sha256 "24fe4d5406db503c207848fea9ad6ead43ce94954ecd05921b1b82fb83e71bb9"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.6/shelly_linux_arm64.tar.gz"
      sha256 "2e2a5bfee59411077f53cf80f80371e6eaeed75e3985f127d66382bdf74731e2"
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
