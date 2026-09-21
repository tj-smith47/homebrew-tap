class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.16"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.16/shelly_darwin_amd64.tar.gz"
      sha256 "7f676d3896ddd5448f4b22188a469329d5ff1670b69ce7b4128a7a5160fbeb20"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.16/shelly_darwin_arm64.tar.gz"
      sha256 "e5dc08933e94cd4a39ef251b78b01bcf7384c0aa50f8b1a0f84933c08910a9ec"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.16/shelly_linux_amd64.tar.gz"
      sha256 "8856948fc9c0169e565c30548c186b0c798d9b08130e6195d91a50cc31f8b625"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.16/shelly_linux_arm64.tar.gz"
      sha256 "4bd8584c24ee7ba558e1fe55321b2d0cca38db188a1c6c66388177f1ec0b0aaa"
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
