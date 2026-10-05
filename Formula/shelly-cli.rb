class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.14.1"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.1/shelly_darwin_amd64.tar.gz"
      sha256 "58a5c3f440b3dda8d6c911c931aa424ee97191caf19b0f6bbf0af8632b730e6b"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.1/shelly_darwin_arm64.tar.gz"
      sha256 "1936003120f2507dc777ee29d45fae85f84680148e3f340434cc5507023a9fe5"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.1/shelly_linux_amd64.tar.gz"
      sha256 "4fc9731b1e1befdb600ddd783bf2b3502940a9e8a9aac0b5f5362dd5c4675dcf"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.1/shelly_linux_arm64.tar.gz"
      sha256 "f148fe6f5ae266a88c8a053fcf4bc03e8ef82ffd70706e7a21220eb6c0341230"
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
