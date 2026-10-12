class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.14.2"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.2/shelly_darwin_amd64.tar.gz"
      sha256 "8be58c426cd3abb1a79c11b33f91bd62a8bba9184b3b6b77ff50c72c6693bc95"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.2/shelly_darwin_arm64.tar.gz"
      sha256 "c4036e8641015e67f497503c145365db50fa67f19ee5fa2188bee67d7a626f01"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.2/shelly_linux_amd64.tar.gz"
      sha256 "f4e676d455abfbdbe536c588a843180b78c8065f933ce934b3340c87a606fd9b"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.2/shelly_linux_arm64.tar.gz"
      sha256 "3eaa7c96802cd98f513230a287f1ac32c475a77fb0f44bf11f65bfc384335527"
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
