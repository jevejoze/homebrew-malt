class Naiveproxy < Formula
  desc "Network proxy"
  homepage "https://github.com/klzgrad/naiveproxy"
  version "130.0.6723.40-1"
  if Hardware::CPU.intel?
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-x64.tar.xz"
    sha256 "248635edc6f5a7480c4705ea61e1601085d3b3d93050aa9bb85c462c8fea211e"
  else
    url "https://github.com/klzgrad/naiveproxy/releases/download/v#{version}/naiveproxy-v#{version}-mac-arm64.tar.xz"
    sha256 "44e9b9002b452aef436a4ddac90e0b40fc190926654177ca11ead0b0394f7849"
  end
  license "BSD-3-Clause"

  def install
    bin.install "naive"
    pkgetc.install "config.json"
  end
  
  service do
    run [opt_bin/"naive","/etc/naiveproxy/config.json"]
    keep_alive true
    error_log_path var/"log/naive.log"
    log_path var/"log/naive.log"
    working_dir ENV["HOME"]
  end
end
