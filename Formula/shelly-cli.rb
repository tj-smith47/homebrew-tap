class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.14.4"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.4/shelly_darwin_amd64.tar.gz"
      sha256 "9bca60e0674b0d35afa39bf38406700484b1c9a0a608578a9991d7cf7123fab9"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.4/shelly_darwin_arm64.tar.gz"
      sha256 "b612841ba7780049f611c417c95d1d9f32917c6c2db211ee93b0d03477c3f15b"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.4/shelly_linux_amd64.tar.gz"
      sha256 "9043b2df23148a1202193db6d7a46b92fbbbdc9507eb147dc22fea11cc848982"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.14.4/shelly_linux_arm64.tar.gz"
      sha256 "26d603d9d079f9b393b9926bd66034b34449c9898338042851dfc5f4435e549c"
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
