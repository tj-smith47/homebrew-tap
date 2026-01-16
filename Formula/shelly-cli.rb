class ShellyCli < Formula
  desc "Command-line interface for Shelly smart home devices with full BLE support"
  homepage "https://github.com/tj-smith47/shelly-cli"
  license "Apache-2.0"
  version "0.6.5"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.5/shelly_darwin_amd64.tar.gz"
      sha256 "511a23ed5b660e40f3143d96bfaf8e8ea742da5a6ef6077314f234e2bfecf81e"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.5/shelly_darwin_arm64.tar.gz"
      sha256 "26ed342477c0b9399c0a93eb313bc52ba3fa8d3a4327d70eea585e290c0498c4"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.5/shelly_linux_amd64.tar.gz"
      sha256 "b9d127b717b9d68cd6f196803784a1a4c2b35c4f0cd945979353a8b4a0d8cceb"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/shelly-cli/releases/download/v0.6.5/shelly_linux_arm64.tar.gz"
      sha256 "f04148a66cae7cb50f57a1ab53705cd566d778c0ef66832e8a3f47fc5fee481d"
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
