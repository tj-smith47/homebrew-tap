class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.5.5"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.5/shelly_darwin_amd64.tar.gz"
      sha256 "68eb1fa837697565306b43c5182ed0fe4045662893f231d44f1c93266c5afeaa"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.5/shelly_darwin_arm64.tar.gz"
      sha256 "959f9243f33ca16fa1eb99b0648c7849186fee0348accd02f19de7d45a2ad342"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.5/shelly_linux_amd64.tar.gz"
      sha256 "a4dc0909bb533f6c2f18f323af46d22553fb1f63a7f26f462dd2a3c4c09f0f79"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.5.5/shelly_linux_arm64.tar.gz"
      sha256 "747bedff8218f2951b4ba04c9215f172ccc018df3b4e89a527d861139d2a9679"
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
