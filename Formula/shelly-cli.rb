class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.8.11"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.11/shelly_darwin_amd64.tar.gz"
      sha256 "b7a80386ba50e51cda2384657c9a58b7e38dee3f0e2093e34023a64b9c6bc2c1"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.11/shelly_darwin_arm64.tar.gz"
      sha256 "b7985e74ab8a04d8b4261108753ce5ab880f1314bb07590088638df7507332af"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.11/shelly_linux_amd64.tar.gz"
      sha256 "78b6c0e2577771d42eb483d0dbf507eb984223dccac941d2b352f573d0dbf492"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.8.11/shelly_linux_arm64.tar.gz"
      sha256 "e2c657e7cc489af49d3a43ad4e5d1203145238a82f5da255b6e0c8f4edcd41d7"
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
