class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.14.9"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.9/shelly_darwin_amd64.tar.gz"
      sha256 "3c68c774e1231003e0d196f329ba494812ead43de54eab097711752547429706"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.9/shelly_darwin_arm64.tar.gz"
      sha256 "2a5755228c55bf586873a5dff0f985023d8db04a1070e58083bbc3800f8c11cd"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.9/shelly_linux_amd64.tar.gz"
      sha256 "b87fc3dd13191b0adc6897070090914136aa3fdd993ba9885b7be65a9aaea7e5"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.9/shelly_linux_arm64.tar.gz"
      sha256 "df1789cedc348af8dbeafb92b0be91691872b744f6fd893541f5b0d4f3598c14"
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
