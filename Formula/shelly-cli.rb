class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.12.15"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.15/shelly_darwin_amd64.tar.gz"
      sha256 "57dd457b06d3b7cf95bfc612e8f4dd33dc5ff9c1282f79eecd13746b52df2edf"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.15/shelly_darwin_arm64.tar.gz"
      sha256 "6f60a42c4e66357276676b2bcfe823ae86972c1760bbaeda9ff7a74c7f1d011d"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.15/shelly_linux_amd64.tar.gz"
      sha256 "31ea675e526c13b86ba896cf22d87307ed5546a0d99db8d548bcc8e29836bb5c"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.12.15/shelly_linux_arm64.tar.gz"
      sha256 "a45dfd334913136938349a86549cdb56e87f209f8635f2f13d223a9def826cce"
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
